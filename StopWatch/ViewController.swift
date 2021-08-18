//
//  ViewController.swift
//  StopWatch
//
//  Created by Hazuki Tamura on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
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
            hanteiLabel.text = ""
        }
    }

    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
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
            count = 0
        timeLabel.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count < 10.2 && count > 9.70  {
           hanteiLabel.text = "perfect"
        }else if count < 10.3 && count > 9.80 {
            hanteiLabel.text = "great"
        }else if count < 10.5 && count > 9.50 {
            hanteiLabel.text = "good"
         }else{
            hanteiLabel.text = "OMG"
         }
    }
    
}

