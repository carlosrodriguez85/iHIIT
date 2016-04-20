//
//  File.swift
//  iHIIT
//
//  Created by Carlos Rodríguez Domínguez on 20/4/16.
//  Copyright © 2016 Everyware Technologies. All rights reserved.
//

import Foundation

class Exercise{
    private(set) var name:String
    private(set) var description:String
    private(set) var youtubeURL:NSURL
    
    var videoURL:NSURL? {
        guard let videos = HCYoutubeParser.h264videosWithYoutubeURL(youtubeURL) else {
            return nil
        }
        
        if let mediumVideo = videos["medium"] as? String {
            return NSURL(string: mediumVideo)
        }
        else{
            return nil
        }
    }
    
    static var exercises = [
        Exercise(name: "Jumping Jacks", description: "Jumping to a position with the legs spread wide and the hands touching overhead, sometimes in a clap, and then returning to a position with the feet together and the arms at the sides.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=c4DAnQ6DtF8")!),
        Exercise(name: "Burpees", description: "Begin in a standing position. Drop into a squat position with your hands on the ground. Kick your feet back, while keeping your arms extended, then do a push up. Immediately return your feet to the squat position. Jump up from the squat position.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=Uy2nUNX38xE")!),
        Exercise(name: "Squat", description: "The movement is initiated by moving the hips back and bending the knees and hips to lower the torso and accompanying weight, then returning to the upright position.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=p3g4wAsu0R4")!),
        Exercise(name: "Squat Jump", description: "Perform a squat and finish it jumping.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=CVaEhXotL7M")!),
        Exercise(name: "Jumping Lunge", description: "Begin with normal lunge, with front leg at a 90 degree angle in the squat position and back leg behind you. Squat body explosively up into a jump. Replace your feet in the air, moving back leg in front, and front leg in back. Go straight into lunge with opposite legs. Keep chest and torso upright and engaged throughout entire movement.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=1ExU8445rbU")!),
        Exercise(name: "Step Up", description: "To start, place your entire right foot onto the bench or chair. Press through your right heel as you step onto the bench, bringing your left foot to meet your left so you are standing on the bench. Return to the starting position by stepping down with the right foot, then the left so both feet are on the floor.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=l4AA5d5mInQ")!),
        Exercise(name: "Mountain Climber", description: "Assume a press up position so your hands are directly under your chest at shoulder width apart with straight arms. Your body should form a straight line from your shoulders to your ankles. Lift your right foot off the floor and slowly raise your knee as close to your chest as you can. Return to the starting position and repeat with your left leg.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=fBZHkGT0W5Y")!),
        Exercise(name: "Skipping", description: "Jump 1 to 2 inches off floor, giving rope just enough space to slip under feet — only the balls of feet should touch the floor. Keep elbows close to sides as you turn the rope. The movement comes from the wrists and forearms, not the shoulders.", youtubeURL: NSURL(string:"https://www.youtube.com/watch?v=GIsphkD1Qxw")!)
    ]
    
    init(name:String, description:String, youtubeURL:NSURL){
        self.name = name
        self.description = description
        self.youtubeURL = youtubeURL
    }
}
