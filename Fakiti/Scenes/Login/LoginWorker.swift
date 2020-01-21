//
//  LoginWorker.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit

typealias ResponseUserHandler = (_ response: LoginModel.FetchData.Response) -> ()

class LoginWorker {
    
    let apiManager = APIServicesManager()
    
    func fetch(name: String, sucess: @escaping(ResponseUserHandler), failure: @escaping (ResponseUserHandler))  {
        
        //TODO
           if name != String()  {
            apiManager.fetchHolderData(user: name) {
                result in
                
                switch result {
                case .success(let data):
                    
                    let loginResponse = LoginModel.FetchData.Response(user: data, isError: false, errorMessage: nil)
                    sucess(loginResponse)
                    
                case .failure(let error):
                    
                    let loginErrorResponse = LoginModel.FetchData.Response(user: nil, isError: true, errorMessage: error.localizedDescription)
                    failure(loginErrorResponse)
                    
                }
                
            }
           } else {
            
        }
        
    }
    
}
