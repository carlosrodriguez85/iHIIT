//
//  ExerciseRowController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit

class ExerciseRowController : NSObject {
    @IBOutlet var titleLabel: WKInterfaceLabel!
    
    var exercise:Exercise? {
        didSet{
            if let exercise = self.exercise{
                self.titleLabel.setText(exercise.name)
            }
        }
    }
}
