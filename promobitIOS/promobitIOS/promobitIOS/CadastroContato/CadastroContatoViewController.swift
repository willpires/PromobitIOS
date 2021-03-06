//
//  CadastroViewController.swift
//  promobitIOS
//
//  Created by william pires on 06/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class CadastroContatoViewController: UIViewController, UITextFieldDelegate {
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
        nomeTextFied.delegate = self
        emailTextField.delegate = self
        empresaTextFiedl.delegate = self
        telefoneTextField.delegate = self
        siteTextField.delegate = self
        addNotaTextField.delegate = self
        
    }
    
    
    func camposValidos() -> Bool{
      
     let campos = [validaNome(),validaEmpresa(),validaSite(),validaEmail(),validaTelefone()]
        for campo in campos {
            if campo == false {
                return false
            }
        }
        
        return true
    }
    
    func validaNome() -> Bool {
        if nomeTextFied.text!.isEmpty  {
            mensagemNomeErrorLabel.text = "Digite seu nome"
            mensagemNomeErrorLabel.textColor = .red
            return false
            
        }else {
            mensagemNomeErrorLabel.textColor = .white
            return true
            
        }
    }
    
    func validaEmpresa() -> Bool {
         
        if empresaTextFiedl.text!.isEmpty {
            mensagemEmpresaErrorLabel.text  = "Digite o nome da empresa"
            mensagemEmpresaErrorLabel.textColor = .red
            return false
            
        }else{
            mensagemEmpresaErrorLabel.textColor = .white
            return true
           
        }
        
    }
    
    func validaEmail() -> Bool {
         if  emailTextField.text!.isEmpty{
            mensagemEmailErrorLabel.text  = "Digite seu email"
            mensagemEmailErrorLabel.textColor  = .red
            return false
            
         }else if isEmailvalido(text: emailTextField.text!){
            
            mensagemEmailErrorLabel.textColor  = .white
            return true
            
         }else {
            mensagemEmailErrorLabel.text  = "Digite um email válido!"
            mensagemEmailErrorLabel.textColor  = .red
            return false
        }
        
    }
    
    func isEmailvalido(text: String) ->Bool {
        let regex  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let format = "SELF MATCHES %@"
        return NSPredicate(format: format, regex).evaluate(with: text)
    }
    
    func validaTelefone() -> Bool {
         if  telefoneTextField.text!.isEmpty {
            mensagemTelefoneErrorLabel.text  = "Digite seu telefone"
            mensagemTelefoneErrorLabel.textColor = .red
            return false
            
        }else {
           mensagemTelefoneErrorLabel.textColor = .white
           return true
            
        }
      
    }
    
    func validaSite() -> Bool {
        
        if  siteTextField.text!.isEmpty {
            mensagemSiteErrorLabel.text  = "Digite um site"
            mensagemSiteErrorLabel.textColor = .red
            return false
            
        }else{
            mensagemSiteErrorLabel.textColor = .white
            return true
        }
        
    }
    
    
    @IBAction func cancelar(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func salvar(_ sender: Any) {
        if camposValidos() {
            
              if let mensagem = Bundle.main.loadNibNamed("SucessoView", owner: Any?.self, options: nil)?.first as? SucessoView {
                mensagem.mensagemLabel.text = "Contado\nadicionado com\nsuceso!"
                let tap = UITapGestureRecognizer(target: self, action: #selector(voltar(sender:)))
                mensagem.voltar.addGestureRecognizer(tap)
                self.view.addSubview(mensagem)
                
              }
            
        }
        
    }
    
    
    @objc func voltar(sender:UITapGestureRecognizer ){
        navigationController?.popViewController(animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nomeTextFied {
            nomeTextFied.resignFirstResponder()
            empresaTextFiedl.becomeFirstResponder()
        }
        
        if textField == empresaTextFiedl {
            empresaTextFiedl.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        }
        
        if textField == emailTextField {
            emailTextField.resignFirstResponder()
            telefoneTextField.becomeFirstResponder()
        }
        
         if textField == telefoneTextField {
            telefoneTextField.resignFirstResponder()
            siteTextField.becomeFirstResponder()
            
        }
               
        if textField == siteTextField {
            siteTextField.resignFirstResponder()
            addNotaTextField.becomeFirstResponder()
        }
        
        if textField == addNotaTextField {
            addNotaTextField.resignFirstResponder()
        }
        
        return true
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
