//
//  Astronaut.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct Astronaut: Codable {

	// MARK: - Types

	private enum AstronautCodingKeys: String, CodingKey {
		case id
		case name
		case nationality
		case bio
		case imageUrl = "profile_image"
		case dob = "date_of_birth"
	}

	// MARK: - Properties

	var id: Int
	var name: String
	var nationality: String
	var bio: String
	var imageUrl: String
	var dob: String

	// MARK: - Initialization

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: AstronautCodingKeys.self)
		self.id = try container.decode(Int.self, forKey: .id)
		self.name = try container.decode(String.self, forKey: .name)
		self.nationality = try container.decode(String.self, forKey: .nationality)
		self.bio = try container.decode(String.self, forKey: .bio)
		self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
		self.dob =  try container.decode(String.self, forKey: .dob)
	}

}
