//
//  HomeRouter.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities


class HomeCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    
    var homeViewController: HomeViewController?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter

    }
    
    func start() {
        let homeViewController = HomeViewController(nibName: nil, bundle: nil)
        homeViewController.title = "Iti-Git"
        presenter.pushViewController(homeViewController, animated: true)
        
        self.homeViewController = homeViewController

    }
    
    func stop() {
        homeViewController?.dismiss(animated: false, completion: nil)
    }
    

    
}

class HomeRouter {
    
    
}


