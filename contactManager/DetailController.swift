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
    
    
    @IBOutlet weak var detail_background: UIView!
    var objContact : MyContact?
    
    @IBOutlet weak var contactTitle: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var largeProfile: UIImageView!
    override func viewDidLoad() {
        
        contactTitle.text = objContact?.contactTitle
        firstName.text = objContact?.firstName
        lastName.text = objContact?.lastName
        cityName.text = objContact?.cityName
        street.text =  objContact?.streetName
        mobileNumber.text = objContact?.mobile_No
        phoneNumber.text = objContact?.cell_NO
        email.text=objContact?.email_Id
        
 
        let url = NSURL(string: (objContact?.largeSizePhoto)!)
        let data = NSData(contentsOf: url! as URL)
        largeProfile.image = UIImage(data: data! as Data)
        
       
        
        
    }
    
}
