//
//  CoffeeModel.swift
//  Ratios
//
//  Created by Tarokh on 7/22/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct CoffeeModel {
    
    // define some variables
    var coffeeRatio: CoffeeRatio?
    
    // define some functions
    mutating func calculateRatio(grams: Double, ratio: Int) {
        let result = grams * Double(ratio)
        self.coffeeRatio = CoffeeRatio(water: result)
    }
    
    func getWater() -> String {
        return String(format: "%.1f", coffeeRatio?.water ?? "0.0")
    }
    
}
