//
//  AstronautsPreviewClient.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct AstronautsPreviewClient: AstronautsService {

	func fetchAstronauts() async throws -> [Astronauts.Astronaut] {
		return Astronauts.preview.astronauts
	}

	func fetchAstronaut(id: Int) async throws -> Astronaut {
		return Astronaut.preview
	}

}
