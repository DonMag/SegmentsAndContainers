//
//  SegContainerViewController.swift
//  IBScratch
//
//  Created by Don Mag on 10/26/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class SegContainerViewController: UIViewController {
	
	@IBOutlet weak var profileContainerView: UIView!
	@IBOutlet weak var modelsContainerView: UIView!

	// we'll use this to update a label in the ModelsVC
	var countOfModelsViews = 0
	
	var theProfileVC: ProfileTableViewController?
	var theModelsVC: ModelsViewControler?
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if let vc = segue.destination as? ProfileTableViewController {
			
			// set the number of rows in each section array in the ProfileVC
			vc.numRowsArray = [2, 3]
			
			// save a reference so we can use it later
			theProfileVC = vc
		}
		
		if let vc = segue.destination as? ModelsViewControler {

			// save a reference so we can use it later
			theModelsVC = vc

		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// start with Profile visible
		// so hide Models and set its alphs to 0
		self.modelsContainerView.alpha = 0
		self.modelsContainerView.isHidden = true
		
    }

	@IBAction func switchAction(_ sender: UISegmentedControl) {

		// on segment select, the "other" container will be
		// transparent and hidden, so
		// un-hide it, then animate the alpha for both (for cross-fade)
		// on animation completion, hide the now transparent container
		
		if sender.selectedSegmentIndex == 0 {
			
			self.profileContainerView.isHidden = false
			UIView.animate(withDuration: 0.5, animations: {
				
				self.profileContainerView.alpha = 1
				self.modelsContainerView.alpha = 0
				
			}, completion: { (finished: Bool) in
				
				self.modelsContainerView.isHidden = true
				
			})
			
		} else {
			
			// we're going to show the ModelsVC, so increment our counter and update the value in the Models view
			countOfModelsViews += 1
			theModelsVC?.theLabel.text = "ModelsVC has been seen \(countOfModelsViews) times!"
			
			self.modelsContainerView.isHidden = false
			UIView.animate(withDuration: 0.5, animations: {
				
				self.profileContainerView.alpha = 0
				self.modelsContainerView.alpha = 1
				
			}, completion: { (finished: Bool) in
				
				self.profileContainerView.isHidden = true
				
			})
			
		}
		
	}
}
