//
//  ProfileTableViewController.swift
//  IBScratch
//
//  Created by Don Mag on 10/26/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ModelsViewControler: UIViewController {
	
}

class ProfileCell: UITableViewCell {
	
	@IBOutlet weak var theLabel: UILabel!
	
}

class ProfileTableViewController: UITableViewController {

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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell

        // Configure the cell...
		cell.theLabel.text = "I'm trying to use a segment controller to switch between my tableView and a container view, but when I try to switch between them it only half works. The TableView appears and disappears, but the container view never appears."

        return cell
    }

}
