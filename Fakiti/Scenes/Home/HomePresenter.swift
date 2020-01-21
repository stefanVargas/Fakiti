//
//  HomePresenter.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit



protocol HomePresenterInput
{
  func presentFetchedOrders(response: HomeHolderModel.FetchData.Response)
}

class HomePresenter {

    weak var viewController: HomeViewController?

    
}

extension HomePresenter: HomePresenterInput {
    func presentFetchedOrders(response: HomeHolderModel.FetchData.Response) {
        
      
        
//        let viewModel = HomeHolderModel.FetchData.ViewModel(displayedTitle: response.holder.name, displayedOptions: options)
    }
    
    
}
