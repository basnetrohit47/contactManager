//
//  ViewController.swift
//  contactManager
//
//  Created by Rohit kumar basnet on 30/01/2019.
//  Copyright © 2019 Rohit kumar basnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource{
    
    var contactsArray : [MyContact] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contactsArray.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! ContactViewController
//        tableCell.name = "Ram Bahadur"
        return tableCell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

