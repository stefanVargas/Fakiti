//
//  Holder.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import Foundation


///User
class Holder: Decodable  {
    
    var login: String?
    var id: String
    var repos: String?
    var followers: String?
    
    private enum CodingKeys: String, CodingKey {
        case repos = "public_repos"
        case login
        case id
        case followers
    }
    
}
