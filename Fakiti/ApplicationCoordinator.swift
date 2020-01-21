//
//  ApplicationCoordinator.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities


class ApplicationCoordinator: Coordinator {
    
 let window: UIWindow
        let rootViewController: UINavigationController
        private var loginCoordinator: LoginCoordinator?
        
        var isAppReady: Bool = false

        
        init(window: UIWindow) {
            self.window = window
            rootViewController = UINavigationController()
            
            rootViewController.navigationBar.appUINavigationBarTextLayout(font: UIFont.getMainFontStringValue(identified: UIFont.MainFonts.trebuchetMS), foregroundColor: .appWhite, underlineColor: .clear, backgroundColor: .clear)
            
            rootViewController.navigationBar.setNavigationBarTransparent()
            rootViewController.navigationBar.tintColor =  .appWhite

            
            
    }
    
    func start() {
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            isAppReady = true
            loginCoordinator = LoginCoordinator(presenter: rootViewController)
            loginCoordinator?.start()

        }
        
}
