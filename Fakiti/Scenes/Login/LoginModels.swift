//
//  LoginModels.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit


enum LoginModel
{
    // MARK: Use cases
    
    enum FetchData
    {
        struct Request
        {
            var name: String?
        }
        
        struct Response
        {
            var user: Holder?
            var isError: Bool
            var errorMessage: String?
        }
        
        struct ViewModel
        {
            var displayedTitle: String?
            var displayedSubTitle: String?
                    
        }
    }
}

