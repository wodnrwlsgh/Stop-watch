//
//  ViewController.swift
//  Stop watch
//
//  Created by D7703_21 on 2018. 4. 9..
//  Copyright © 2018년 D7703_21. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    var count = 0
    var myTimer = Timer()
    var min = 0
    var sec = 0
    var msec = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stop.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func updateTime(){
        count = count + 1
        min = count / 60 / 100
        sec = (count - (min * 60 * 100)) / 100
        msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    @IBAction func Start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()})
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func Stop(_ sender: Any) {
        myTimer.invalidate()
        start.isEnabled = true
        stop.isEnabled = false
    }
    @IBAction func Reset(_ sender: Any) {
        myTimer.invalidate()
        count = 0;
        min = 0;
        sec = 0;
        msec = 0;
        timeLabel.text = "00:00:00"
    }
    
    
    
}
