//
//  FirstViewController.swift
//  YourPad
//
//  Created by Casey on 3/8/16.
//  Copyright © 2016 Casey. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate{
    
    @IBOutlet weak var hiHatButton: UIButton!
    @IBOutlet weak var crashButton: UIButton!
    @IBOutlet weak var rideButton: UIButton!
    @IBOutlet weak var snareButton: UIButton!
    @IBOutlet weak var kickButton: UIButton!
    @IBOutlet weak var rackTomButton: UIButton!
    @IBOutlet weak var floorTomButton: UIButton!
    
    @IBOutlet weak var soundBankPickerView: UIPickerView!
    
    var soundBanks = ["beatbox", "drykit", "eightOhEight"]
    var currentBank = String()
    let beatbox = Drumset(kitName: "beatbox")
    let drykit = Drumset(kitName: "drykit")
    let eightOhEight = Drumset(kitName: "eightOhEight")
    let player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.soundBankPickerView.delegate = self
        self.soundBankPickerView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ** Player **
    @IBAction func playSound(sender: UIButton) {
        if currentBank == "beatbox" {
            beatbox.play(sender.tag)
        }
        else if currentBank == "drykit" {
            drykit.play(sender.tag)
        }
        else if currentBank == "eightOhEight" {
            eightOhEight.play(sender.tag)
        }
        
    }
    @IBAction func stopSound(sender: UIButton) {
        if currentBank == "beatbox" {
            beatbox.stop(sender.tag)
        }
        else if currentBank == "drykit" {
            drykit.stop(sender.tag)
        }
        else if currentBank == "eightOhEight" {
            eightOhEight.stop(sender.tag)
        }
    }

    
    // ** BUTTONS **
    // ** Hi Hat Button **
    @IBAction func hiHatTouchDown(sender: UIButton) {
        hiHatButton.setImage(UIImage(named: "hiHat_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func hiHatTouchUp(sender: UIButton) {
        hiHatButton.setImage(UIImage(named: "hiHat_off.png"), forState: UIControlState.Normal)
//        stopSound(hiHatButton)
    }
    
    //** Crash Button **
    @IBAction func crashTouchDown(sender: UIButton) {
        crashButton.setImage(UIImage(named: "crash_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func crashTouchUp(sender: UIButton) {
        crashButton.setImage(UIImage(named: "crash_off.png"), forState: UIControlState.Normal)
//        stopSound(crashButton)
    }
    
    // ** Ride Button **
    @IBAction func rideTouchDown(sender: UIButton) {
        rideButton.setImage(UIImage(named: "ride_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func rideTouchUp(sender: UIButton) {
        rideButton.setImage(UIImage(named: "ride_off.png"), forState: UIControlState.Normal)
//        stopSound(rideButton)
    }
    
    // ** Snare Button **
    @IBAction func snareTouchDown(sender: UIButton) {
        snareButton.setImage(UIImage(named: "snare_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func snareTouchUp(sender: UIButton) {
        snareButton.setImage(UIImage(named: "snare_off.png"), forState: UIControlState.Normal)
//        stopSound(snareButton)
    }
    
    // ** Kick Button **
    @IBAction func kickTouchDown(sender: UIButton) {
        kickButton.setImage(UIImage(named: "kick_on.png"), forState: UIControlState.Normal)
       
    }
    
    @IBAction func kickTouchUp(sender: UIButton) {
        kickButton.setImage(UIImage(named: "kick_off.png"), forState: UIControlState.Normal)
//        stopSound(kickButton)
    }
    
    // ** Rack Tom Button **
    @IBAction func rackTomTouchDown(sender: UIButton) {
        rackTomButton.setImage(UIImage(named: "rackTom_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func rackTomTouchUp(sender: UIButton) {
        rackTomButton.setImage(UIImage(named: "rackTom_off.png"), forState: UIControlState.Normal)
//        stopSound(rackTomButton)
    }
    
    // ** Floor Tom Button **
    @IBAction func floorTomTouchDown(sender: UIButton) {
        floorTomButton.setImage(UIImage(named: "floorTom_on.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func floorTomTouchUp(sender: UIButton) {
        floorTomButton.setImage(UIImage(named: "floorTom_off.png"), forState: UIControlState.Normal)
//        stopSound(floorTomButton)
    }
    
    
    // ** Picker View **
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundBanks.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return soundBanks[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentBank = soundBanks[row]
        
    }

}

