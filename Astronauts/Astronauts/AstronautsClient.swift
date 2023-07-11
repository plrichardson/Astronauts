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
	}

	func fetchAstronauts() async throws -> [Astronauts.Astronaut] {

		return Astronauts.preview.astronauts

		/*
		 let urlString = "https://spacelaunchnow.me/api/3.5.0/astronaut/"
		 if let url = URL(string: urlString) {
		 let request = URLRequest(url: url)
		 let (data, _) = try await URLSession.shared.data(for: request)
		 let result = try JSONDecoder().decode(Astronauts.self, from: data)
		 return result.astronauts
		 } else {
		 throw AstronautError.invalidURL
		 }
		 */
		
	}

	func fetchAstronaut(id: Int) async throws -> Astronaut {

		//		return Astronaut.preview
		
		let urlString = "https://spacelaunchnow.me/api/3.5.0/astronaut/\(id)"
		if let url = URL(string: urlString) {
			let request = URLRequest(url: url)
			let (data, _) = try await URLSession.shared.data(for: request)
			return try JSONDecoder().decode(Astronaut.self, from: data)
		} else {
			throw AstronautError.invalidURL
		}


	}

}
