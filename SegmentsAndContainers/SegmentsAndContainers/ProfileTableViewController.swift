//
//  ProfileTableViewController.swift
//  IBScratch
//
//  Created by Don Mag on 10/26/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ModelsViewControler: UIViewController {
	
	@IBOutlet weak var theLabel: UILabel!
	
}

class ProfileCell: UITableViewCell {
	
	@IBOutlet weak var theLabel: UILabel!
	
}

class ProfileTableViewController: UITableViewController {
	
	var numRowsArray = [1, 1]

    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 100
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Description"
		}
		return "Section Title 2"
	}
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numRowsArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numRowsArray[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell

        // Configure the cell...
		if indexPath.section == 0 && indexPath.row == 0 {
			cell.theLabel.text = "I'm trying to use a segment controller to switch between my tableView and a container view, but when I try to switch between them it only half works. The TableView appears and disappears, but the container view never appears."
		} else if indexPath.section == 1 && indexPath.row == 2 {
			cell.theLabel.text = "You wouldn't see this if the MainVC had not been able to communicate with this VC"
		} else {
			cell.theLabel.text = "\(indexPath)"
		}

        return cell
    }

}
