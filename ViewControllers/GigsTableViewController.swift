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
		}
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "LoginModalSegue" {
			guard let loginVC = segue.destination as? LoginViewController else { return }
			loginVC.gigController = gigController
		}
    }
}
