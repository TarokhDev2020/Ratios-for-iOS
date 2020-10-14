//
//  RoundedButton.swift
//  Ratios
//
//  Created by Tarokh on 7/22/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

@IBDesignable

open class RoundedButton: UIButton {
    
    // define some functions
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
}
