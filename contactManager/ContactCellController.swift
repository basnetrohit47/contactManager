//
//  ContactCellController.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 31/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import Foundation
import UIKit
class  ContactCellController: UITableViewCell {
    @IBOutlet weak var contact_name: UILabel!
    @IBOutlet weak var image_Src: UIImageView!
    @IBOutlet weak var email_Id: UILabel!
    
    override func awakeFromNib() {
        image_Src.layer.cornerRadius = image_Src.frame.size.width/2
        image_Src.clipsToBounds = true
    }
    
    
}
