//
//  ViewController.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 30/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var contactsArray : [MyContact] = []
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contactsArray.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! ContactCellController
        tableCell.contact_name?.text = "Ram Bahadur"
        return tableCell
    }
    
    //nvaigation to detail page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //row selection
        performSegue(withIdentifier: "detail_page", sender: self)
    }
    
    //function for defining seuge- navigating to new view , Detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="detail_page"{
            let detailViewController=segue.destination as? DetailController
            
        }
    }
 


}

