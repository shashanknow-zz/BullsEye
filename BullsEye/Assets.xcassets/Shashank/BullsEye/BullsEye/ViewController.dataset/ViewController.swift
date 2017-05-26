//
//  ViewController.swift
//  BullsEye
//
//  Created by Shashank Kunikullaya on 5/5/17.
//  Copyright © 2017 Shashank Kunikullaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var targetValue = 0
    var currentValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let difference  = abs(currentValue - targetValue)
        var points = 100 - difference
        var title: String
        if difference == 0 {
            title = "Cha gaye guru! bonus 100"
            points += 100
        }
        else if difference < 5 {
            title = "kaafi kareeb the!"
            if difference == 1 {
                title = "Only 1 off, bonus 50 lele..."
                points += 50
            }
        }
        else if difference < 10 {
            title = "Maza nahi aya yaar..."
        }
        else {
            title = "bohot hi ghatiya estimate tha..."
        }
        score += points
        let message  = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler:  {action in self.startNewRound(); self.updateLabels() })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    func startNewRound() {
        round += 1
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
}

