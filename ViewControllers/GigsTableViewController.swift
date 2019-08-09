//
//  GigsTableViewController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {

	private let gigController = GigController()

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.tableFooterView = UIView()
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		if gigController.bearer == nil {
			performSegue(withIdentifier: "LoginModalSegue", sender: self)
		} else {
			gigController.fetchAllGigs { (_) in
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}

	var dateFormatter: DateFormatter = {
		var formatter = DateFormatter()
		formatter.dateFormat = "MMM dd, YYYY"
		return formatter
	}()

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let gigs = gigController.gigs
        return gigs.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigCell", for: indexPath)

		let gig = gigController.gigs[indexPath.row]

		cell.textLabel?.text = gig.title
		cell.detailTextLabel?.text = dateFormatter.string(from: gig.dueDate)

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "LoginModalSegue" {
			guard let loginVC = segue.destination as? LoginViewController else { return }
			loginVC.gigController = gigController
		}

		if segue.identifier == "GigDetailSegue" {
			if let detailVC = segue.destination as? GigDetailViewController,
				let indexPath = tableView.indexPathForSelectedRow {
				detailVC.gig = gigController.gigs[indexPath.row]
				detailVC.gigController = gigController
			}
		} else if segue.identifier == "AddGigSegue" {
			if let addVC = segue.destination as? GigDetailViewController {
				addVC.gigController = gigController
			}
		}
    }
}
