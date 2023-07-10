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

	struct Astronaut: Codable {

		// MARK: - Types

		private enum AstronautCodingKeys: String, CodingKey {
			case name
			case nationality
			case image = "profile_image_thumbnail"
		}

		// MARK: - Properties

		var name: String
		var nationality: String
		var image: String

		// MARK: - Initialization

		init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: AstronautCodingKeys.self)
			self.name = try container.decode(String.self, forKey: .name)
			self.nationality = try container.decode(String.self, forKey: .nationality)
			self.image = try container.decode(String.self, forKey: .image)
		}

	}

}
