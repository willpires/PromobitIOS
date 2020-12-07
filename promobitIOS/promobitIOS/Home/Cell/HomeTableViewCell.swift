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
      //  imagemView.layer.cornerRadius = imagemView.frame.height / 2.0
        // Initialization code
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
               imagemView.image = nil
           }
       }
    
    
}
