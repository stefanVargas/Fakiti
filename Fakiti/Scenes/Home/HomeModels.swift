//
//  HomeModels.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit

enum HomeHolderModel
{
    // MARK: Use cases
    
    enum FetchData
    {
        struct Request
        {
            
        }
        
        struct Response
        {
            var holder: Holder?
            var isError: Bool
            var errorMessage: String?
        }
        
        struct ViewModel
        {
            struct DisplayedTitle
            {
                
                var message: String
                var name: String
                var totalBalance: String
            }            
            
            struct DisplayedOption
            {
                var title: String
                var subTitle: String?
            }
            
        }
    }
}

