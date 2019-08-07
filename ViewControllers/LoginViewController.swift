//
//  LoginViewController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


	@IBOutlet weak var segControl: UISegmentedControl!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		segControl.tintColor = #colorLiteral(red: 0.07289885035, green: 0.2915680405, blue: 0.3605711734, alpha: 1)
        button.layer.borderWidth = 1.5
		button.layer.borderColor = #colorLiteral(red: 0.07289885035, green: 0.2915680405, blue: 0.3605711734, alpha: 1)
		button.layer.cornerRadius = 8
    }
    
	@IBAction func segControlValueChanged(_ sender: UISegmentedControl) {
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
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
