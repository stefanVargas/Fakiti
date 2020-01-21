//
//  StartButton.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities


class StartButton: CustomCodeButton {
    
    override func setupViews() {
                
        let orange: CGColor = UIColor.gradientOrange.cgColor
        let salmon: CGColor = UIColor.gradientSalmon.cgColor
        let pink: CGColor = UIColor.gradientPink.cgColor
        
        let colors = [orange, salmon, pink ]
        let gradient = CAGradientLayer(start: .topRight, end: .bottomLeft, colors: colors, type: .axial)
        
        gradient.frame = self.bounds
        gradient.borderWidth = 0.0
        gradient.cornerRadius = 5
        self.layer.insertSublayer(gradient, at: 0)
        
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.1
        self.layer.cornerRadius = 5
                
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .center
        
        self.setTitleColor(.appWhite, for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.titleLabel?.font =  UIFont.init(name: UIFont.MainFonts.gillSansBold.rawValue, size: 18)
        self.setTitle("Login", for: .normal)
    }
}




