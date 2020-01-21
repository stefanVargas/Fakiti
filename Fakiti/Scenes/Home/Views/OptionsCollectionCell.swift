//
//  OptionsCollectionCell.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 20/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

class OptionsCollectionCell: UICollectionViewCell {

    typealias VF = VisualFormatter
    
    let insideView: UIView = {

        let cv = UIView()
        let orange: CGColor = UIColor.gradientOrange.cgColor
        let salmon: CGColor = UIColor.gradientSalmon.cgColor
        let pink: CGColor = UIColor.gradientPink.cgColor
        
        let colors = [orange, salmon, pink ]
        let gradient = CAGradientLayer(start: .topRight, end: .bottomLeft, colors: colors, type: .axial)
        
        gradient.frame = cv.bounds
        gradient.borderWidth = 0.0
        gradient.cornerRadius = 5
        cv.layer.insertSublayer(gradient, at: 0)
        
        cv.layer.borderColor = UIColor.darkGray.cgColor
        cv.layer.borderWidth = 0.1
        cv.layer.cornerRadius = 5

        return cv
    }()
    
    let titleLabel: UILabel! = {
        
        let lbl = UILabel()
        lbl.textColor = .appWhite
        lbl.font = UIFont(name: UIFont.MainFonts.gillSans.rawValue, size: 13)
        lbl.layer.masksToBounds = true
        
        return lbl
    }()
    
    let subTitleLabel: UILabel! = {
        
        let lbl = UILabel()
        lbl.textColor = .appWhite
        lbl.font = UIFont(name: UIFont.MainFonts.gillSansLight.rawValue, size: 11)
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
         setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        
        
    }
    
    private func setupViews() {
        
        let spaceView = UIView()
        
        addSubview(insideView)
        
        setupConstraints(pattern: VF.fullHorDefault, views: insideView)
        setupConstraints(pattern: VF.fullVerDefault, views: insideView)
        
        insideView.addSubview(spaceView)
        insideView.addSubview(titleLabel)
        insideView.addSubview(subTitleLabel)
        spaceView.backgroundColor = .clear
        
        setupConstraints(pattern: VF.fullHorTotal, views:spaceView)
        setupConstraints(pattern: "V:|-3-[v0(\(self.frame.height * (59/100)))]-4-[v1(<=40)]" , views: spaceView, titleLabel)
        
        setupConstraints(pattern: VF.fullHorDefault , views:titleLabel)
        setupConstraints(pattern: VF.fullHorDefault , views:subTitleLabel)
        setupConstraints(pattern: "V:[v0(<=40)]-3-[v1(<=40)]" , views: titleLabel, subTitleLabel)
        
    }
}
