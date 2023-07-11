//
//  AstronautsClient.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct AstronautsClient: AstronautsService {

	enum AstronautError: Error {
		case invalidURL
		case tooManyRequests
	}

	func fetchAstronauts() async throws -> [Astronauts.Astronaut] {

		let urlString = "https://spacelaunchnow.me/api/3.5.0/astronaut/"
		if let url = URL(string: urlString) {
			let request = URLRequest(url: url)
			let (data, response) = try await URLSession.shared.data(for: request)
			if let httpResponse = response as? HTTPURLResponse,
			   httpResponse.statusCode == 429 {
				throw AstronautError.tooManyRequests
			}
			let result = try JSONDecoder().decode(Astronauts.self, from: data)
			return result.astronauts
		} else {
			throw AstronautError.invalidURL
		}

	}

	func fetchAstronaut(id: Int) async throws -> Astronaut {

		let urlString = "https://spacelaunchnow.me/api/3.5.0/astronaut/\(id)"
		if let url = URL(string: urlString) {
			let request = URLRequest(url: url)
			let (data, response) = try await URLSession.shared.data(for: request)
			if let httpResponse = response as? HTTPURLResponse,
			   httpResponse.statusCode == 429 {
				throw AstronautError.tooManyRequests
			}
			return try JSONDecoder().decode(Astronaut.self, from: data)
		} else {
			throw AstronautError.invalidURL
		}

	}

}
