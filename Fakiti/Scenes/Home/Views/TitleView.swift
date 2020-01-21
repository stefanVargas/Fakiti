//
//  TitleView.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 20/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities


class TitleView: CustomCodeView {
    
    
    static let holderImage = UIImage()//UIImage(named: Project.defaultImage)

    var authorNameLabel: UILabel! = {
        let lbl = UILabel()
        lbl.font = UIFont(name: UIFont.MainFonts.courierBold.rawValue, size: 18)
        lbl.textColor = .appWhite
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var photo: UIImageView = {
        
        let imgView = UIImageView(image: holderImage)
        imgView.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imgView
    }()
      
    func start(frame: CGRect, title: String, imageName: String, from data: Bool) {
        setupView()
        self.authorNameLabel.text = title
        
        if data {
            self.photo.imageFromURL(imageName)
        } else {
            self.photo.image = UIImage(named: imageName)
        }
    }
    
    
    func setupView()  {
        self.backgroundColor = .darkBackGroundColor
        
        let sizer = SizeHandler()
        let height = sizer.percentOfFrame(percent: 31, dimension: .height)
        let width = sizer.percentOfFrame(percent: 100, dimension: .width)
        let widthLabel = sizer.frameDivided(In: 1, dimension: .width)
        let space = sizer.percentOfFrame(percent: 2, dimension: .height)
        let sizeCircle = width / (height/70)
       
        addSubview(self.photo)
        addSubview(self.authorNameLabel)
        self.authorNameLabel.font = UIFont(name: UIFont.MainFonts.gillSans.rawValue, size: height/10)
        
        setupConstraints(pattern: "H:|-(>=16)-[v0(\(sizeCircle))]-(>=16)-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: photo)
        setupConstraints(pattern: "H:|[v0(\(widthLabel))]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: authorNameLabel)
        
        setupConstraints(pattern: "V:|-(>=4)-[v0(\(sizeCircle))]-(\(space))-[v1(>=18)]-(>=12)-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, views: photo, authorNameLabel)
        
    }
}

// MARK: END TitleView to extensions
extension TitleView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
 
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var layerBackgroundColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.backgroundColor!)
        }
        set {
            self.backgroundColor = nil
            self.layer.backgroundColor = newValue.cgColor
        }
    }
    
}
