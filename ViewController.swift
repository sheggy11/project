//
//  ViewController.swift
//  Project
//
//  Created by Асгат Шагиахметов on 07.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func musicButton(_ sender: Any) {
    }
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var nameOfPage: UILabel!
    
    var timerCounting:Bool = false
    var timer = Timer()
    var time = 30 {
        
            didSet {
                timeLabel.text = "\(time)"
            }
        }
        
        
        
    @IBAction func restart(_ sender: Any) {
        timer.invalidate()
        time = 30
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        }
        
        @objc func tick() {
            time -= 1
            
            
            if time == 0 {
                timer.invalidate()
                statusLabel.text = "Медитация завершена"
            }
            
            
            if(timerCounting)
                    {
                        timerCounting = false
                        timer.invalidate()
                        startstopButton.setTitle("продолжить", for: .normal)
                        
                        }
                            else
                            {
                                //если время не шло(те при нажатии на "продолжить" или "старт")-запускаю таймер и счетчик
                                timerCounting = true
                                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
                                
                                //меняю кнопку "продолжить"(или "старт") на "паузу" и анимированно возвращаю в начальное положение
                                startstopButton.setTitle("пауза", for: .normal)
                                
        }
    
    
            func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setTitle("", for: .normal)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fon.png")!)
        
        
    }

    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
            {
                return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
            }
         
        func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            timeString += " : "
            timeString += String(format: "%02d", seconds)
            return timeString
        }
    
    
    
}

}
