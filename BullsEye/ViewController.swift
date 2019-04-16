//
//  ViewController.swift
//  BullsEye
//
//  Created by Simon McNeil on 2019-04-04.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //following few lines is to customize how our slider looks
        let thumbImageNormal =  UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        startNewGame()
    }
    
    //slider value action
    @IBAction func sliderMove(_ slider: UISlider) {
        //lroundf lets you round the decimal number to the nearest whole number
        sliderValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        //calculate the points by finding the difference in what you put and the target value, then subtract it by 100
        let difference = abs(targetValue - sliderValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference < 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }

        //keeps track of points in the round
        score += points

        
        let message = "You scored \(points) points.\n The value that you guessed was \(lroundf(slider.value))."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {_ in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver() {
        startNewGame()
    
    }
    
    func startNewRound() {
        round +=  1
        targetValue = Int.random(in: 1...100)
        slider.value = 50.0
        updateLabels()
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

