//
//  TrainingInterfaceController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class TrainingInterfaceController: WKInterfaceController {
    @IBOutlet var timer: WKInterfaceTimer!
    @IBOutlet var exerciseTitle: WKInterfaceLabel!
    @IBOutlet var exerciseDescription: WKInterfaceLabel!
    
    private var exerciseIndex:Int = 0

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        showExercise()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        NSObject.cancelPreviousPerformRequestsWithTarget(self) //avoid delayed "performSelector" call after deactivating the controller
    }

    func showExercise() {
        guard exerciseIndex < Exercise.exercises.count else {
            dismissController()
            return
        }
        
        let exercise = Exercise.exercises[exerciseIndex]
        
        exerciseTitle.setText(exercise.name)
        exerciseDescription.setText(exercise.description)
        
        timer.setDate(NSDate(timeIntervalSinceNow: 30))
        timer.start()
        performSelector(#selector(nextExercise), withObject: nil, afterDelay: 30)
    }
    
    func nextExercise() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        timer.stop()
        exerciseIndex += 1
        
        showExercise()
    }
    
    @IBAction func skipTapped() {
        nextExercise()
    }
}
