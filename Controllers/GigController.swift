//
//  GigController.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


class GigController {
	enum HTTPMethod: String {
		case get = "GET"
		case put = "PUT"
		case post = "POST"
		case delet = "DELETE"
	}

	var bearer: Bearer?
	let baseURL = URL(string: "https://lambdagigs.vapor.cloud/api")!

	func signUp(with username: String, password: String, completion: @escaping(Error?) -> Void) {

		let signUpURL = baseURL
			.appendingPathComponent("users")
			.appendingPathComponent("signup")

		var requestURL = URLRequest(url: signUpURL)
		requestURL.httpMethod = HTTPMethod.post.rawValue
		requestURL.setValue("application/json", forHTTPHeaderField: "Content-Type")

		let user = User(username: username, password: password)

		do {
			let jsonEncoder = JSONEncoder()
			let userData = try jsonEncoder.encode(user)
			requestURL.httpBody = userData
		} catch {
			NSLog("Error encoding user info: \(error)")
		}

		URLSession.shared.dataTask(with: requestURL) { (data, response, error) in

			if let response = response as? HTTPURLResponse,
				response.statusCode != 200 {
				NSLog("Response status code is not 200. Status code: \(response.statusCode)")
				completion(nil)
			}

			if let error = error {
				NSLog("Error creating user: \(error)")
				completion(error)
				return
			}
			completion(nil)
		}.resume()
	}


	func logIn(with username: String, password: String, completion: @escaping(Error?) -> Void) {

		let loginURL = baseURL
			.appendingPathComponent("users")
			.appendingPathComponent("login")

		var request = URLRequest(url: loginURL)
		request.httpMethod = HTTPMethod.post.rawValue
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		let user = User(username: username, password: password)

		do {
			let userData = try JSONEncoder().encode(user)
			request.httpBody = userData
		} catch {
			NSLog("Error encoding user data: \(error)")
		}

		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let response = response as? HTTPURLResponse,
				response.statusCode != 200 {
				NSLog("Response status code is not 200. Status code: \(response.statusCode)")
			}

			if let error = error {
				NSLog("Error verifying user: \(error)")
				completion(error)
				return
			}

			guard let data = data else {
				NSLog("No data returned from data task")
				completion(NSError())
				return
			}

			do {
				let bearer = try JSONDecoder().decode(Bearer.self, from: data)
				self.bearer = bearer
				completion(nil)
			} catch {
				NSLog("Error decoding bearer token: \(error)")
				completion(error)
				return
			}
		}.resume()
	}
}
