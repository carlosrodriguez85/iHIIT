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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
