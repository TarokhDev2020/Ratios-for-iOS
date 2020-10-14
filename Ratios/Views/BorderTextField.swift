//
//  BorderTextField.swift
//  Ratios
//
//  Created by Tarokh on 7/22/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

@IBDesignable
open class BorderTextField: UITextField {
    
    // define some functions
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor(named: "Primary")?.cgColor
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
