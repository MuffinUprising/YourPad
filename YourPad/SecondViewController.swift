//
//  SecondViewController.swift
//  YourPad
//
//  Created by Casey on 3/8/16.
//  Copyright © 2016 Casey. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate{
    
    //**MAJOR KEYS**
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c4: UIButton!
    //**MINOR KEYS**
    @IBOutlet weak var cSharp: UIButton!
    @IBOutlet weak var dSharp: UIButton!
    @IBOutlet weak var fSharp: UIButton!
    @IBOutlet weak var gSharp: UIButton!
    @IBOutlet weak var aSharp: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var soundBanks = ["jobro", "ax80", "stereopiano"]
    var currentBank = String()
    let jobro = Pianoset(bankName: "jobro")
    let ax80 = Pianoset(bankName: "ax80")
    let stereopiano = Pianoset(bankName: "stereopiano")
    let player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSound(sender: UIButton) {
        if currentBank == "jobro" {
            jobro.play(sender.tag)
        } else if currentBank == "ax80" {
            ax80.play(sender.tag)
        } else if currentBank == "stereopiano" {
            stereopiano.play(sender.tag)
        }
    }

    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
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

