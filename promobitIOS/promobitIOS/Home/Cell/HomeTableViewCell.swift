//
//  HomeTableViewCell.swift
//  promobitIOS
//
//  Created by william pires on 07/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemView: UIImageView!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var empresaLabel: UILabel!
    
    @IBOutlet weak var novoButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initValues()
    }
    
    func initValues(){
        imagemView.layer.cornerRadius = 30      // Initialization code
        novoButton.layer.cornerRadius = 15
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func prepareCell(item: Contato){
           nomeLabel.text = item.user_name
           empresaLabel.text = item.user_company
           if let url = URL(string: item.user_photo){
               imagemView.kf.setImage(with: url)
           }else {
           }
        print("-- .\(item.user_novo) nome \(item.user_name)")
            if !item.user_novo {
                novoButton.isHidden = true
            }else {
                novoButton.isHidden = false

        }
        
       }
    
    
}
