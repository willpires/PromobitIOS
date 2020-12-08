//
//  HomeModel.swift
//  promobitIOS
//
//  Created by william pires on 07/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import Foundation
import Alamofire

class HomeModel {
    
    let UrlBase = "https://gist.githubusercontent.com/rnas/c925888cb8f52306c82fc0dfc9a3fd79/raw/fb98b80d2a7e8d9dc0c4369650f518fa68f1e407/contacts.json"
    
    func getContato(sucesso: @escaping ([Contato])-> Void, error: @escaping () -> Void){

        AF.request(UrlBase,method: .get,encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
                
            case .success:
                if let res = response.value as? NSArray {
                    let lista = res.map({(item: Any) -> Contato in
                        let contato = Contato()
                        let item  = item as![String: Any]
                        contato.user_name = item["user_name"] as! String
                        contato.user_lastname = item["user_lastname"] as! String
                        contato.user_company = item["user_company"] as! String
                        contato.user_photo = item["user_photo"] as! String
                        return contato
                    })
                sucesso(lista)
                    break
                  
                }
                
            case .failure(_):
                error()
                break
            }
        }
    }
    
}
