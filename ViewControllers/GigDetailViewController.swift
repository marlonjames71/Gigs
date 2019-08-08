//
//  GigDetailViewController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/8/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class GigDetailViewController: UIViewController {


	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var datePicker: UIDatePicker!
	@IBOutlet weak var dueDateLabel: UILabel!
	@IBOutlet weak var detailsLabel: UILabel!
	@IBOutlet weak var detailsTextView: UITextView!

	var gig: Gig?
	var gigController: GigController?
	

    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
    }
    
	@IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let title = titleTextField.text,
			let details = detailsTextView.text else { return }

		let gig = Gig(title: title, description: details, dueDate: datePicker.date)
		gigController?.createGig(gig: gig, completion: { (_) in
			DispatchQueue.main.async {
				self.navigationController?.popToRootViewController(animated: true)
			}
		})
	}

	func updateViews() {
		guard let gig = gig else { return }
		titleTextField.text = gig.title
		datePicker.date = gig.dueDate
		detailsTextView.text = gig.description
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}