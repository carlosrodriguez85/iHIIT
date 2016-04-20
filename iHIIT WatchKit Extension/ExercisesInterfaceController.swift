//
//  ExercisesInterfaceController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class ExercisesInterfaceController: WKInterfaceController {
    @IBOutlet var table: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        table.setNumberOfRows(Exercise.exercises.count, withRowType: "ExerciseRow")
        for index in 0..<table.numberOfRows {
            if let controller = table.rowControllerAtIndex(index) as? ExerciseRowController {
                controller.exercise = Exercise.exercises[index]
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return Exercise.exercises[rowIndex]
    }
}
