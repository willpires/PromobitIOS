//
//  ViewController.swift
//  promobitIOS
//
//  Created by william pires on 06/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit
import SideMenu
import FirebaseAnalytics
import PKHUD

@available(iOS 13.0, *)
class HomeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var constraintMensagem: UIStackView!
    @IBOutlet weak var filtroButtomItem: UIBarButtonItem!
    
    @IBOutlet weak var menuButtonItem: UIBarButtonItem!
    @IBOutlet weak var addContatoButton: UIButton!
    let homePresenter = HomePresenter()
    var contatoList: [Contato] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        initValues()
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initValues()
    }
    
   func  initValues(){
    HUD.show(.progress)
    addContatoButton.layer.cornerRadius = 30
    addContatoButton.layer.shadowRadius = 5
    addContatoButton.layer.shadowOpacity = 0.25
    addContatoButton.layer.shadowOffset = CGSize(width: 0, height: 10)
    
    if let mensagem = Bundle.main.loadNibNamed("HomeView", owner: Any?.self, options: nil)?.first as? mensagemNotContactView {
        self.view.addSubview(mensagem)
    }

    homePresenter.get(sucesso: { (contatos) in
        if contatos.count > 0 {
           self.contatoList = contatos
            self.table.separatorStyle = .singleLine
              if let mensagem = Bundle.main.loadNibNamed("HomeView", owner: Any?.self, options: nil)?.first as? mensagemNotContactView {
                self.view.willRemoveSubview(mensagem)
                self.view.addSubview(self.table)
                self.view.addSubview(self.addContatoButton)
                
                    }
            
            self.table.reloadData()
            HUD.hide()

        }

    }, error: {
        HUD.flash(.error)
        
        if let mensagem = Bundle.main.loadNibNamed("HomeView", owner: Any?.self, options: nil)?.first as? mensagemNotContactView {
               self.table.addSubview(mensagem)
           }
        
    })
    
    }

    @IBAction func add(_ sender: Any) {
      let params = ["will":"ok"]
      Analytics.logEvent("testePromobit", parameters: params)
        
    }
    
    @IBAction func showAdd(_ sender: Any) {
        showMenu()
    }
    
    @IBAction func filtro(_ sender: Any) {
        
        
    }
    
    func ordenacaoNomeAandZ(){
       
    }
    
    func ordenacaoNomeZandA(){
        
    }
    
    func ordenacaoEmpresaAandZ(){
        
    }
    
     func ordenacaoEmpresaZandA(){
           
       }
    
    func showMenu(){
        let menu = storyboard?.instantiateViewController(identifier: "menuController") as! MenuViewController
        let sideMenu = UISideMenuNavigationController(rootViewController: menu)
        sideMenu.setNavigationBarHidden(true, animated: false)
        SideMenuManager.defaultManager.menuBlurEffectStyle  = .regular
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)

        present(sideMenu, animated: true, completion: nil)

    }
    
}


@available(iOS 13.0, *)
extension HomeViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                	
        return self.contatoList.count
    }
        
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let contato = contatoList[indexPath.row]
        cell.prepareCell(item: contato)

        return cell
    }
    
}
