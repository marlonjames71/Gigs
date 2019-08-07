//
//  Bearer.swift
//  Gigs
//
//  Created by Marlon Raskin on 8/7/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


struct Bearer: Codable {
	let id: Int
	let token: String
	let userID: Int
}
