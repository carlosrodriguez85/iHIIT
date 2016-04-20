//
//  HIITInterfaceController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class HIITInterfaceController: WKInterfaceController {
    @IBOutlet var timer: WKInterfaceTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        timer.setDate(NSDate(timeIntervalSinceNow: 10))
        performSelector(#selector(beginTraining), withObject: nil, afterDelay: 10)
        timer.start()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func beginTraining() {
        presentControllerWithName("TrainingInterfaceController", context: self)
    }

    @IBAction func beginTapped() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
    }
}
