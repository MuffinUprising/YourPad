//
//  Pianoset.swift
//  YourPad
//
//  Created by Casey on 3/13/16.
//  Copyright © 2016 Casey. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class Pianoset {
    
    var players: [AVAudioPlayer?]
    var bankName: String!
    
    let keyNames = ["c3", "c3Sharp", "d3", "d3Sharp", "e3", "f3", "f3Sharp", "g3", "g3Sharp", "a4", "a4Sharp", "b4", "c4"]
    
    init(bankName: String) {
        
        players = keyNames.map { note in
            let filename = (bankName + note)
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
}