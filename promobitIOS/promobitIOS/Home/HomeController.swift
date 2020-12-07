//
//  ViewController.swift
//  promobitIOS
//
//  Created by william pires on 06/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var constraintMensagem: UIStackView!

    @IBOutlet weak var addContatoButton: UIButton!
    let homePresenter = HomePresenter()
    var contatoList: [Contato] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        initValues()
        //table.removeFromSuperview()
       // a()
      //  constraintMensagem.removeFromSuperview()
        // Do any additional setup after loading the view.
       // teste()
    }
    
    
    func a(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.view.addSubview(self.table)
//        }
        self.view.addSubview(self.table)
    }
    
    
   func  initValues(){
        
    addContatoButton.layer.cornerRadius = addContatoButton.frame.height / 2.0
    addContatoButton.layer.shadowRadius = 5
    addContatoButton.layer.shadowOpacity = 0.25
    addContatoButton.layer.shadowOffset = CGSize(width: 0, height: 10)
    self.table.addSubview(constraintMensagem)
    //self.constraintMensagem.removeFromSuperview()

    homePresenter.get(sucesso: { (contatos) in
      
        if contatos.count > 0 {
           self.contatoList = contatos
            print("\(contatos.count)")
            self.table.separatorStyle = .singleLine
//            self.view.addSubview(self.table)
            self.constraintMensagem.removeFromSuperview()
            self.table.reloadData()
         
        }
        
    }, error: {
       
        
    })
    
    }

    @IBAction func add(_ sender: Any) {
      
    }
    
}


extension HomeViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                	
        return self.contatoList.count
    }
        
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
//        let contato = contatoList[indexPath.row]
//        cell.prepareCell(item: contato)

        return cell
    }
    
}
