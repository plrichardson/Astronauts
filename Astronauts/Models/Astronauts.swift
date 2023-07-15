//
//  Astronauts.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct Astronauts: Codable {

	// MARK: - Types

	private enum RootCodingKeys: String, CodingKey {
		case results
	}

	// MARK: - Properties

	var astronauts: [Astronaut]

	// MARK: - Initialization

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: RootCodingKeys.self)
		self.astronauts = try container.decode([Astronaut].self, forKey: .results)
	}

}

extension Astronauts {

	struct Astronaut: Codable, Identifiable {

		// MARK: - Types

		private enum AstronautCodingKeys: String, CodingKey {
			case id
			case name
			case nationality
			case imageUrl = "profile_image_thumbnail"
		}

		// MARK: - Properties

		var id: Int
		var name: String
		var nationality: String
		var imageUrl: String

		// MARK: - Initialization

		init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: AstronautCodingKeys.self)
			self.id = try container.decode(Int.self, forKey: .id)
			self.name = try container.decode(String.self, forKey: .name)
			self.nationality = try container.decode(String.self, forKey: .nationality)
			self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
		}

	}

}
