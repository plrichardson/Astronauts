//
//  AstronautsService.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

protocol AstronautsService {
	func fetchAstronauts() async throws -> [Astronauts.Astronaut]
	func fetchAstronaut(id: Int) async throws -> Astronaut
}
