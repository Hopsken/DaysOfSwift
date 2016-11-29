//
//  ViewController.swift
//  StopWatch
//
//  Created by shaowei on 2016/11/29.
//  Copyright © 2016年 shaowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0.0
        timeLabel.text = String(Counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender: Any) {
        if(IsPlaying){
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    
    
    
    func UpdateTimer() {
        Counter += 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
    
}

