//
//  ViewController.swift
//  TappingGame
//
//  Created by HappyJedi on 05.01.16.
//  Copyright © 2016 HappyJedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var timeInt = 0
    var tapInt = 0
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    @IBOutlet weak var TapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeInt = 10
        tapInt = 0
        
        TimeLabel.text = String(timeInt)
        ScoreLabel.text = String(tapInt)
        
        TapButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func StartGame(sender: AnyObject) {
        
        if timeInt == 10 {
            
            tapInt = 0
            
            ScoreLabel.text = String(tapInt)
            TimeLabel.text = String(timeInt)
            
            TapButton.enabled = true
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("startCounter"), userInfo: nil, repeats: true)
            
        }
        
    }
    
    func startCounter() {
        
        timeInt -= 1
        
        TimeLabel.text = String(timeInt)
        
        if timeInt == 0 {
            
            timer.invalidate()
            
        }
        
    }



    @IBAction func TapMe(sender: AnyObject) {
        
        if timeInt > 0 {
            
            tapInt += 1
            ScoreLabel.text = String(tapInt)
            
        }
        
        if timeInt == 0 {
            
            TapButton.enabled = false
            
            timeInt = 10
            tapInt = 0
            
        }
        
    }
    
}

