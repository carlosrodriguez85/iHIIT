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
    @IBOutlet var videoThumbnail: WKInterfaceImage!
    @IBOutlet var videoButton: WKInterfaceButton!

    var exercise:Exercise? = nil
    
    private var videoURL:NSURL? = nil
    
    @IBAction func buttonTapped() {
        if let exercise = exercise, let videoURL = videoURL {
            presentMediaPlayerControllerWithURL(videoURL, options: nil, completion: {(_, _, error) in
                if error != nil{
                    let actions = [
                        WKAlertAction(title: "Cancel", style: .Cancel, handler: {
                            // do nothing, it is dismissed by default
                        }),
                        WKAlertAction(title: "Open in Phone", style: .Cancel, handler: {
                            self.updateUserActivity("es.everywaretech.iHIIT.description", userInfo: nil, webpageURL: exercise.youtubeURL)
                        })
                    ]
                    self.presentAlertControllerWithTitle("Error", message: "The video format is not supported by the Watch", preferredStyle: .Alert, actions: actions)
                }
            })
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if let exercise = context as? Exercise {
            self.exercise = exercise
            
            self.setTitle(exercise.name)
            self.descriptionLabel.setText(exercise.description)
            
            self.videoButton.setHidden(true)
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
                self.videoURL = exercise.videoURL
                
                HCYoutubeParser.thumbnailForYoutubeURL(exercise.youtubeURL, thumbnailSize: YouTubeThumbnailDefaultMedium, completeBlock: { (image, error) in
                    dispatch_async(dispatch_get_main_queue(), {
                        if error == nil {
                            self.videoThumbnail.setImage(image)
                        }
                        else{
                            self.videoThumbnail.setImage(UIImage(named: "hiit_background"))
                        }
                        self.videoButton.setHidden(false)
                    })
                })
            })
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
