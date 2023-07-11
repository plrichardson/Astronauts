//
//  AstronautCellViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

@MainActor
final class AstronautCellViewModel: ObservableObject, Identifiable {

	// MARK: - Properties

	private let astronautsService: AstronautsService

	let id: Int
	let name: String
	let nationality: String
	let imageUrl: URL?

	var astronautDetailViewModel: AstronautDetailViewModel {
		.init(astronautsService: astronautsService,
			  id: id
		)
	}

	// MARK: - Initialization

	init(astronaut: Astronauts.Astronaut, astronautsService: AstronautsService) {
		self.id = astronaut.id
		self.name = astronaut.name
		self.nationality = astronaut.nationality
		self.imageUrl = URL(string: astronaut.imageUrl)
		self.astronautsService = astronautsService
	}

}

