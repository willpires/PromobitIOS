//
//  HomePresenter.swift
//  promobitIOS
//
//  Created by william pires on 07/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import Foundation

class HomePresenter {
    let model = HomeModel()
    
    func get(sucesso: @escaping ([Contato]) -> Void, error: @escaping ()->Void){
        
        model.getContato(sucesso: { (lista) in
            sucesso(lista)
        }, error: {
            error()
        })
    }
}
