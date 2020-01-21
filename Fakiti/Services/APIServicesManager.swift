//
//  APIServicesManager.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 20/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import Foundation

protocol ApiCallErrorHandler: class {
    func alertUrlPathError()
    func alertNetWorkError()
    func alertUserError()
}

class APIServicesManager {
    
//    weak var delegate: ApiCallErrorHandler?
    let kPageUrlUser = "https://api.github.com/users/[username]"
    let kPageUrlUserRepos = "https://api.github.com/users/[username]/repos"
    let kReplacableString  = "[username]"
    
    func fetchHolderData(user: String, completion: @escaping (Result<Holder, Error>) -> ()) {
        
        let pageUrl =  self.kPageUrlUser.replacingOccurrences(of: kReplacableString, with: user)
        
        guard let url = URL(string: pageUrl) else {
            //  URL Error
//            delegate?.alertUrlPathError()
            
            return }

            URLSession.shared.dataTask(with: url) { (data, response, err) in
                
                guard let data = data else {
                    
                    //  No Internet
//                    self.delegate?.alertNetWorkError()
                                        
                    return }
                
                guard let decodedData = try? JSONDecoder().decode(Holder.self, from: data) else {
                    
                    DispatchQueue.main.sync {
//                        self.delegate?.alertUserError()
                    }
                    guard let erro = err else { return }
                    completion(Result.failure(erro))
                    
                    return
                }
                
                //  No User
                if decodedData.login == nil {
//                    self.delegate?.alertUserError()
                }
                
                completion(Result.success(decodedData))
            }.resume()
     
        }    
}
