//
//  MyContact.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 30/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import Foundation
class MyContact{
    var contactTitle : String
    var firstName : String
    var lastName : String
    
    var streetName : String
    var cityName : String
    var email_Id : String
    var mobile_No : String
    var cell_NO : String
    var profilePhoto : String
    var largeSizePhoto : String
    
    init(contactTitle : String, firstName : String, lastName : String, streetName : String, cityName : String, email_Id : String, mobile_No : String, cell_NO : String, profilePhoto : String, largeSizePhoto : String) {
        self.contactTitle=contactTitle
        self.firstName=firstName
        self.lastName=lastName
        
        self.streetName=streetName
        self.cityName=cityName
        self.email_Id=email_Id
        self.mobile_No=mobile_No
        self.cell_NO=cell_NO
        self.profilePhoto=profilePhoto
        self.largeSizePhoto=largeSizePhoto
        
    }
    
    func getContacts() -> Array<MyContact> {
        var contacts : Array<MyContact> = []
        return contacts
    }
    


}
