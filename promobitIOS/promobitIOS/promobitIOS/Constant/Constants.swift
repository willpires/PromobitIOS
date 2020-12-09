//
//  Constants.swift
//  promobitIOS
//
//  Created by william pires on 08/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import Foundation

class Constant {
    static let baseUrl = "https://gist.githubusercontent.com/"
    static let contactsUrl = "rnas/c925888cb8f52306c82fc0dfc9a3fd79/raw/fb98b80d2a7e8d9dc0c4369650f518fa68f1e407/contacts.json"
    
    static func getContactsUrl() -> String {
        return baseUrl+contactsUrl
    }
    
}
