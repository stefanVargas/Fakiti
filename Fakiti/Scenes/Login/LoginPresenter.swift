//
//  LoginPresenter.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import Foundation

protocol LoginPresenterInput {
    
    func setResultsToPresent(response:LoginModel.FetchData.Response)
    
}

protocol LoginPresenterOutput {
    var userResponse: LoginModel.FetchData.Response? { get }
    var viewModel: LoginModel.FetchData.ViewModel { get set}
    
    func setInitialPresenterOutput(loginViewController: LoginViewDisplayInput)
    
    
}

class LoginPresenter {
    
    typealias LoginViewModel = LoginModel.FetchData.ViewModel
    
    weak var loginViewController: LoginViewDisplayInput?
    var router: LoginRouterInput?
    var userResponse: LoginModel.FetchData.Response?
    var viewModel: LoginModel.FetchData.ViewModel =  LoginViewModel(displayedTitle: "Bem-Vindo ao teste da API do GitHub", displayedSubTitle: "Digite o nome do Usuário e pressione 'Login'")
    
    func start()  {
        loginViewController?.displayData(viewModel: self.viewModel)
    }
    
}


extension LoginPresenter: LoginPresenterInput, LoginPresenterOutput {
    func setInitialPresenterOutput(loginViewController: LoginViewDisplayInput) {
        self.loginViewController = loginViewController
    }
    
    
    func setResultsToPresent(response: LoginModel.FetchData.Response) {
        self.userResponse = response
        router?.response = response
        
        
    }
        
}


