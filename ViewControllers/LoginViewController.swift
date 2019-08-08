//
//  LoginViewController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

enum LoginType {
	case signUp
	case logIn
}

class LoginViewController: UIViewController {

	@IBOutlet weak var segControl: UISegmentedControl!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var button: UIButton!

	var gigController: GigController?
	var loginType: LoginType = .signUp

    override func viewDidLoad() {
        super.viewDidLoad()
		segControl.tintColor = #colorLiteral(red: 0.07289885035, green: 0.2915680405, blue: 0.3605711734, alpha: 1)
        button.layer.borderWidth = 1.5
		button.layer.borderColor = #colorLiteral(red: 0.07289885035, green: 0.2915680405, blue: 0.3605711734, alpha: 1)
		button.layer.cornerRadius = 8
    }
    
	@IBAction func signInTypeChanged(_ sender: UISegmentedControl) {
		if segControl.selectedSegmentIndex == 0 {
			loginType = .signUp
			button.setTitle("Sign Up", for: .normal)
		} else {
			loginType = .logIn
			button.setTitle("Sign In", for: .normal)
		}
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		guard let username = usernameTextField.text,
			let password = passwordTextField.text,
			!username.isEmpty,
			!password.isEmpty else { return }

		if loginType == .signUp {
			gigController?.createUser(with: username, password: password, completion: { (error) in
				guard error == nil else { return }

				DispatchQueue.main.async {
					let alert = UIAlertController(title: "Sign Up Successful!", message: "Please log in now", preferredStyle: .alert)
					alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
						self.loginType = .logIn
						self.segControl.selectedSegmentIndex = 1
						self.button.setTitle("Sign In", for: .normal)
					}))
					self.present(alert, animated: true, completion: nil)
				}
			})
		} else {
			gigController?.logIn(with: username, password: password, completion: { (error) in
				guard error == nil else { return }

				DispatchQueue.main.async {
					self.dismiss(animated: true, completion: nil)
				}
			})
		}
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}
