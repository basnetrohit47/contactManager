//
//  DetailController.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 31/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import Foundation
import UIKit
class DetailController: ViewController  {
     var objContact : MyContact?
    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var firstName: UILabel!
    override func viewDidLoad() {
        print(objContact?.firstName)
        test.text = objContact?.firstName
        
    }
    
}
