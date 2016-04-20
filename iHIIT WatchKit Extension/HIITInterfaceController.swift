//
//  HIITInterfaceController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation

protocol TrainingDelegate {
    func trainingDidEnd()
}

class HIITInterfaceController: WKInterfaceController, TrainingDelegate {
    @IBOutlet var timer: WKInterfaceTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        timer.setDate(NSDate(timeIntervalSinceNow: 10))
        performSelector(#selector(beginTraining), withObject: nil, afterDelay: 10)
        timer.start()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        stopTimer()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        stopTimer()
        return self
    }
    
    func beginTraining() {
        presentControllerWithName("TrainingInterfaceController", context: self)
        stopTimer()
    }
    
    private func stopTimer() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        timer.setDate(NSDate())
        timer.stop()
    }

    @IBAction func beginTapped() {
        stopTimer()
    }
    
    func trainingDidEnd() {
        popController()
    }
}
