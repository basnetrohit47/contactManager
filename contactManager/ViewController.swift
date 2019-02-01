//
//  ViewController.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 29/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var contactsArray : [MyContact] = []
    var currentContact : MyContact?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        getContactsFromAPI()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! ContactCellController
        var myCnt=contactsArray[indexPath.row]
       
        tableCell.contact_name?.text = myCnt.firstName+" " + myCnt.lastName
        tableCell.email_Id?.text = myCnt.email_Id
        let url = NSURL(string: myCnt.profilePhoto)
        let data = NSData(contentsOf: url! as URL)
       
        tableCell.image_Src.image = UIImage(data: data! as Data)
        
        if (indexPath.row % 2 == 0){
            tableCell.backgroundColor = UIColor(displayP3Red: 151/255, green: 242/255, blue: 133/255, alpha: 0.1)

        }
        else{
            tableCell.backgroundColor = UIColor(displayP3Red: 151/255, green: 242/255, blue: 133/255, alpha: 0.4)

        }
        
        
        
        return tableCell
    }
    
    //nvaigation to detail page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //row selection
        currentContact = contactsArray[indexPath.row]
        performSegue(withIdentifier: "detail_page", sender: self)
    }
    
    //function for defining seuge- navigating to new view , Detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail_page"{
            let detailViewController=segue.destination as? DetailController
            detailViewController?.objContact = currentContact
       
        }
    }
 
    
    
    
    func getContactsFromAPI(){
    let url = URL(string:"https://randomuser.me/api/?results=50")
    let task = URLSession.shared.dataTask(with: url!) {
    (data,response,error) in
    guard let jsonResponse = (try?  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
    print("Not containing JSON")
    return
    }
    print(jsonResponse)
    do {
    if var data = data,
    var results = jsonResponse["results"] as? [[String: Any]] {
    
    var contactTitle : String!
    var firstName : String!
    var lastName : String!
    var streetName : String!
    var cityName : String!
    var mobile_No : String!
    var cell_NO : String!
    var email_Id : String!
    var profilePhoto : String!
    var largeSizePhoto : String!
        
        
        
    for result in results {
    if var name = result["name"] as? [String: Any]{
    contactTitle=name["title"] as? String ?? ""
    firstName=name["first"] as? String ?? ""
    lastName=name["last"] as? String  ?? ""
    }
    
    email_Id = result["email"] as? String ?? ""
    mobile_No = result["phone"] as? String ?? ""
    cell_NO = result["cell"] as? String ?? ""
    
    if var location = result["location"] as? [String: Any]{
    streetName = location["street"] as? String ?? ""
    cityName=location["city"] as? String ?? ""
    }
    
    if var picture = result["picture"] as? [String: Any]{
    profilePhoto = picture["thumbnail"] as? String ?? ""
    largeSizePhoto=picture["large"] as? String ?? ""
    }
    
    let objContact = MyContact.init(contactTitle: contactTitle!, firstName: firstName!, lastName: lastName, streetName: streetName, cityName: cityName, email_Id: email_Id!, mobile_No: mobile_No, cell_NO: cell_NO, profilePhoto: profilePhoto!,largeSizePhoto: largeSizePhoto)
    self.contactsArray.append(objContact)
    }
    
    }
    } catch {
    print("Error deserializing JSON: \(error)")
    }
    
    DispatchQueue.main.async {
    self.tableView.reloadData()
    
    }
    }
    task.resume()
    }
    
    
    



}

