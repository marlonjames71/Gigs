//
//  GigsTableViewController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		performSegue(withIdentifier: "LoginModalSegue", sender: self)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.tableFooterView = UIView()
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
