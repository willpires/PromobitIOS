//
//  MenuViewController.swift
//  promobitIOS
//
//  Created by william pires on 07/12/20.
//  Copyright © 2020 william pires. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate {

    
    @IBOutlet weak var tabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.delegate = self 
        
        // Do any additional setup after loading the view.
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


