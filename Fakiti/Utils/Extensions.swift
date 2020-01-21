//
//  Extensions.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

//MARK: UIColor
extension UIColor {
    
    static var darkBackGroundColor: UIColor { return UIColor.fromHex(hexValue: 0x2B384B) }
    static var appWhite: UIColor { return UIColor.fromHex(hexValue: 0xFAFAFA)}
    static var gradientOrange: UIColor { return UIColor.fromHex(hexValue: 0xE86D36) }
    static var gradientSalmon: UIColor { return UIColor.fromHex(hexValue: 0xEE586E) }
    static var gradientPink: UIColor { return UIColor.fromHex(hexValue: 0xED4F8F) }

    
}

//MARK: UIImageView
extension UIImageView {
    
    var imageCache: NSCache<AnyObject, AnyObject> {
        
        return  NSCache<AnyObject, AnyObject>()
    }
    
    func imageFromURL(_ imageString: String) {
        
        guard let imageURL = URL(string: imageString) else { return }
        if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: imageURL.absoluteString as AnyObject)
                    self.image = image
                }
            })
        }.resume()
    }
    
    func setCircleImageView()  {
        self.layer.borderWidth = 0.40
         self.layer.masksToBounds = false
         self.layer.borderColor = UIColor.black.cgColor
         self.layer.cornerRadius = self.frame.height/2
         self.clipsToBounds = true
     }
    
}
