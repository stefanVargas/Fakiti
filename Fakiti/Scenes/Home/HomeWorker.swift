//
//  HomeWorker.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import Foundation

typealias ResponseHandler = (_ reponse: HomeHolderModel.FetchData.Response) -> ()

class HomeWorker {
    
    func fetch(name: String, sucess: @escaping(ResponseHandler), failure: @escaping (ResponseHandler))  {
        
        //TODO
        
    }
}
