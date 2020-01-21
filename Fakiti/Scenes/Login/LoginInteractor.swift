//
//  LoginInteractor.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import Foundation


protocol LoginInteractorInput {
    
    func fetchUser(resquest: LoginModel.FetchData.Request)
    
}

protocol LoginInteractorOutput {
    
    var userResponse: LoginModel.FetchData.Response? { get }
    
}

class LoginInteractor {
    var loginWorker = LoginWorker()
    var presenter = LoginPresenter()
    
    var userResponse: LoginModel.FetchData.Response?
}


extension LoginInteractor: LoginInteractorInput, LoginInteractorOutput{
    
    func fetchUser(resquest: LoginModel.FetchData.Request) {
        //TODO
        
        self.loginWorker.fetch(name: resquest.name ?? String(), sucess: { (response) in
            
            self.userResponse = response
            self.presenter.setResultsToPresent(response: response)

        
        }) { (failure) in
            
            self.userResponse = failure
            self.presenter.setResultsToPresent(response: failure)
            
            
        
        }
    }
    

    
    
}
