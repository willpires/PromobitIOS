//
//  ContatosRepository.swift
//  promobitIOS
//
//  Created by william pires on 08/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import Foundation
import Alamofire

class ContatosRepository {
    
    func requestContatos(sucesso: @escaping ([Contato])-> Void, error: @escaping () -> Void){

        AF.request(Constant.getContactsUrl(),method: .get,encoding: JSONEncoding.default).responseJSON { (response) in
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
                        contato.user_novo = item["user_novo"] as! Bool
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
