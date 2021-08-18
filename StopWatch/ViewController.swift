//
//  ViewController.swift
//  StopWatch
//
//  Created by Hazuki Tamura on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    var count:Float = 0.0
    var timer: Timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func start() {
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }

    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        
    }
    
    @objc func up(){
        count = count + 0.01
        timeLabel.text = String(format: "%.2f", count)
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
            timeLabel.text = "0.00"
    }
    
}

