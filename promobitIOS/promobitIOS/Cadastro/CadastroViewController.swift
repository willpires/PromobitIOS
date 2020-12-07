//
//  CadastroViewController.swift
//  promobitIOS
//
//  Created by william pires on 06/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {
//TextFied
    @IBOutlet weak var nomeTextFied: UITextField!
    @IBOutlet weak var empresaTextFiedl: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var addNotaTextField: UITextField!
    
//Label
    @IBOutlet weak var mensagemNomeErrorLabel: UILabel!
    @IBOutlet weak var mensagemEmpresaErrorLabel: UILabel!
    @IBOutlet weak var mensagemEmailErrorLabel: UILabel!
    @IBOutlet weak var mensagemTelefoneErrorLabel: UILabel!
    @IBOutlet weak var mensagemSiteErrorLabel: UILabel!
    @IBOutlet weak var mensagemAddNotaErrorLabel: UILabel!

//Button
    
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    func initValues(){
        let color =  UIColor(red: 0.0, green: 186.0, blue: 255.0, alpha: 1.0)
        cancelarButton.layer.cornerRadius = 2
        cancelarButton.layer.borderWidth = 1.2
        cancelarButton.layer.borderColor = color.cgColor
        salvarButton.layer.cornerRadius = 2
        
        mensagemNomeErrorLabel.textColor = .white
        mensagemEmpresaErrorLabel.textColor = .white
        mensagemEmailErrorLabel.textColor = .white
        mensagemTelefoneErrorLabel.textColor = .white
        mensagemSiteErrorLabel.textColor = .white
        mensagemAddNotaErrorLabel.textColor = .white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
