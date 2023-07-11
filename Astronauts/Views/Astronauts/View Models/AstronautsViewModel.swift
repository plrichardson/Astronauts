//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

@MainActor
final class AstronautsViewModel: ObservableObject {

	// MARK: - Types

	enum State {
		case fetching
		case data
		case error(message: String)
	}

	// MARK: - Properties

	private(set) var navigationTitle = "Astronauts"
	private(set) var astronautsService: AstronautsService
	@Published private(set) var state: State = .fetching
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
			state = .data
		} catch  {
			state = .error(message: "Astronauts is unable to fetch data: \(error)")
		}
	}

	func sort() {
		guard !astronautCellViewModels.isEmpty else {
			return
		}

		astronautCellViewModels.sort { lhc, rhc in
			lhc.name < rhc.name
		}
	}

}
