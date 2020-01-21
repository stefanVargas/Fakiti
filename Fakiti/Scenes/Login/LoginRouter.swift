//
//  LoginRouter.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

protocol LoginRouterInput: class {
    
    var response: LoginModel.FetchData.Response? { get set }
    
}


protocol LoginRouterOutput: class {
    
    func showHomeViewController()
    func passHolderDataToHome(response: LoginModel.FetchData.Response?)
    
}

class LoginCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    var homeCoordinator: HomeCoordinator?

    var loginViewController: LoginViewController?
    var response: LoginModel.FetchData.Response?

    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter

    }
    
    func start() {
        let loginViewController = LoginViewController(nibName: nil, bundle: nil)
        loginViewController.title = "Login"
        presenter.pushViewController(loginViewController, animated: true)
        
        self.loginViewController = loginViewController
        self.loginViewController?.router = self
    }
    
    func stop() {
        loginViewController?.dismiss(animated: false, completion: nil)
    }
        
}

extension LoginCoordinator: LoginRouterOutput, LoginRouterInput {
    
    func showHomeViewController() {
        let homeCoord = HomeCoordinator(presenter: presenter)
        self.homeCoordinator = homeCoord
        
        
        homeCoordinator?.start()
        passHolderDataToHome(response: self.response ?? nil)
        
    }
    
    func passHolderDataToHome(response: LoginModel.FetchData.Response?) {
        
    }
    
    
}





