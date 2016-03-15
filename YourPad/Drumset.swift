//
//  Drumset.swift
//  YourPad
//
//  Created by Casey on 3/8/16.
//  Copyright © 2016 Casey. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class Drumset {
    
    var players: [AVAudioPlayer?]
    var kitName: String!
    
    let drumNames = ["hihat", "crash", "ride", "snare", "kick", "racktom", "floortom"]
    
    init(kitName: String) {
        
        players = drumNames.map { drumType in
            let filename = (kitName + drumType)
            if let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "wav") {
                return (try? AVAudioPlayer(contentsOfURL: url))
            } else {
                return nil
            }
        }
    }
    
    func play(index: Int) {
        if !players.isEmpty && index >= 0 && index < players.count {
            players[index]?.play()
        }
    }
    
    func stop(index: Int) {
        if !players.isEmpty && index >= 0 && index < players.count {
            players[index]?.stop()
        }
    }
}
