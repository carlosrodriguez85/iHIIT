//
//  DescriptionInterfaceController.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import WatchKit
import Foundation


class DescriptionInterfaceController: WKInterfaceController {
    @IBOutlet var descriptionLabel: WKInterfaceLabel!
    @IBOutlet var movie: WKInterfaceMovie!

    var exercise:Exercise? = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if let exercise = context as? Exercise {
            self.exercise = exercise
            
            self.setTitle(exercise.name)
            descriptionLabel.setText(exercise.description)
            
            if let videoURL = exercise.videoURL{
                movie.setMovieURL(videoURL)
            }
            else{
                movie.setHidden(true)
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

}
