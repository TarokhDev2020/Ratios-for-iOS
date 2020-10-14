//
//  TimerModel.swift
//  Ratios
//
//  Created by Tarokh on 7/22/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

class TimerModel {
    
    // define some variables
    var totalSecond = 0
    var seconds: Int?
    var minutes: Int?
    var callback: ((Int) -> Void)
    var timer = Timer()
    
    // define some functions
    init(totalSecond: Int, callback: @escaping(Int) -> Void) {
        self.totalSecond = totalSecond
        self.callback = callback
    }
    
    func runTimer(counter: Int, callback: @escaping (Int) -> Void) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: TimerModel(totalSecond: counter, callback: callback), repeats: true)
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if let userInfo = timer.userInfo as? TimerModel {
            userInfo.totalSecond += 1
            minutes = (userInfo.totalSecond % 3600) / 60
            seconds = (userInfo.totalSecond % 3600) % 60
            userInfo.callback(userInfo.totalSecond)
        }
    }
    
}
