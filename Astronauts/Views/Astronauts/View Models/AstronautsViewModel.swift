//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

@MainActor
final class AstronautsViewModel: ObservableObject {

	// MARK: - Properties

	private(set) var navigationTitle = "Astronauts"
	private let astronautsService: AstronautsService
	@Published private(set) var astronautCellViewModels: [AstronautCellViewModel] = []

	// MARK: - Initialization

	init(astronautsService: AstronautsService) {
		self.astronautsService = astronautsService
	}

	// MARK: - Public API

	func start() async {
		do {
			let astronauts = try await astronautsService.fetchAstronauts()
			astronautCellViewModels = astronauts
				.map { astronaut in
					AstronautCellViewModel(astronaut: astronaut)
				}
		} catch  {
			print("Unable to fetch Astronauts")
		}

	}

}
