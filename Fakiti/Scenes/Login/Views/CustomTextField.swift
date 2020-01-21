//
//  CustomTextField.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 20/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

class CustomTextField: UIView {
    
    typealias VF = VisualFormatter

    
    //MARK: Atributes
    static var identifier: String {
        return String(describing: self)
    }
    
    var insideTextField: UITextField = {
        let cv = UITextField()
        cv.tintColor = .gradientSalmon
        cv.textColor = .appWhite
        cv.font = UIFont(name: UIFont.MainFonts.gillSans.rawValue, size: 18)
        
        return cv
    }()
    
    var editState: CustomState = .inactive
    
    enum CustomState {
        
        case inactive
        case active
    }
        

    let gitButtonTag = 33
    
    func start() {
        setupViews()
    }
    
    func updateGitState(state: CustomState) {
        
        switch state {
        case .active:
            UIView.animate(withDuration: 3.0) {
                self.borderColor = .gradientOrange
            }
        case .inactive:
            UIView.animate(withDuration: 3.0) {
                self.borderColor = .gray
            }
        }
    }
    
    // MARK: GitTextField Setup Methods
    private func setupViews() {
        self.addSubview(insideTextField)
        self.contentMode = .center
        setupConstraints(pattern: VF.fullHorDefault, views: insideTextField)
        setupConstraints(pattern: VF.fullVerTotal, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: insideTextField)
        
        setTextFieldLayout()
    }
    
    func setTextFieldLayout() {
        self.cornerRadius = 10.0
        self.borderWidth = 0.80
        self.borderColor = UIColor.gray
    }

}

// MARK: END CustomTextField to extensions
extension CustomTextField {
    
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

