//
//  ViewController.swift
//  Ratios
//
//  Created by Tarokh on 7/22/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var coffeeTextField: BorderTextField!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var waterLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startButton: RoundedButton!
    @IBOutlet var ResetButton: UIButton!
    
    
    //MARK: - Variables
    var timer = Timer()
    var isClicked = false
    var totalSecond = 0
    var seconds: Int?
    var minutes: Int?
    var coffeeModel = CoffeeModel()
    var timerModel: TimerModel?
    

    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.waterLabel.text = coffeeModel.getWater()
        
        coffeeTextField.tag = 1
        waterTextField.tag = 2
        coffeeTextField.delegate = self
        waterTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CoffeeViewController.dismissKeyboard))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - @IBActions
    @IBAction func startPressed(_ sender: Any) {
        isClicked.toggle()
        if isClicked {
            self.startButton.setTitle("Pause", for: .normal)
            runTimer()
        }
        else {
            self.startButton.setTitle("Resume", for: .normal)
            self.timer.invalidate()
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        isClicked = false
        self.startButton.setTitle("Start", for: .normal)
        totalSecond = 0
        timer.invalidate()
        timerLabel.text = "00:00"
    }
    
    

}

//MARK: - UITextFieldDelegate
extension CoffeeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let grams = (coffeeTextField.text! as NSString).doubleValue
        let ratio = (waterTextField.text! as NSString).integerValue
        self.coffeeModel.calculateRatio(grams: grams, ratio: ratio)
        self.waterLabel.text = coffeeModel.getWater()
        return true
    }
    
}

//MARK: - Functions
extension CoffeeViewController {
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CoffeeViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        totalSecond += 1
        minutes = (totalSecond % 3600) / 60
        seconds = (totalSecond % 3600) % 60
        self.timerLabel.text = String(format: "%02d:%02d", minutes!, seconds!)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}
