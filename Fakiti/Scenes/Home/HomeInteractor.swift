//
//  HomeInteractor.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit

protocol HomeInteractorInput
{
    func fetchRepos(name: String)
}

protocol HomeInteractorOutput
{
    var holder: Holder? { get }
}


class HomeInteractor {
        
    var homeWorker = HomeWorker()
    var presenter: HomePresenterInput?
    var holder: Holder?
    
}

extension HomeInteractor: HomeInteractorInput, HomeInteractorOutput {
   
    // MARK: - Fetch orders
    func fetchRepos(name: String)
    {
        self.homeWorker.fetch(name: name, sucess: { response in
            
            
            self.holder = response.holder
            self.presenter?.presentFetchedOrders(response: response)
            
            
        }) { failure in
            
            
            
        }
        
    }
    
    
}
