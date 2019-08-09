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

		detailsTextView.layer.borderWidth = 2
		detailsTextView.layer.borderColor = #colorLiteral(red: 0.07289885035, green: 0.2915680405, blue: 0.3605711734, alpha: 0.6397502876)
		detailsTextView.layer.cornerRadius = 8
    }
    
	@IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let title = titleTextField.text,
			let details = detailsTextView.text,
			let gigController = gigController else { return }

		let gig = Gig(title: title, description: details, dueDate: datePicker.date)

		let gigs = gigController.gigs.filter( { $0 == gig })
		print(gigs.count)

		if gigs != [] {
			let alert = UIAlertController(title: "Gig already exists",
										  message: "Please make sure to enter new information",
										  preferredStyle: .alert)
			let action = UIAlertAction(title: "OK", style: .default, handler: nil)
			alert.addAction(action)
			present(alert, animated: true, completion: nil)
		} else {
			gigController.createGig(gig: gig, completion: { (_) in
				DispatchQueue.main.async {
					self.navigationController?.popToRootViewController(animated: true)
				}
			})
		}
	}

	func updateViews() {
		guard let gig = gig else { return }
		titleTextField.text = gig.title
		datePicker.date = gig.dueDate
		detailsTextView.text = gig.description
	}

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
