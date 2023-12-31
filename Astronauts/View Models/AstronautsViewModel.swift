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

	let reloadButtonTitle = "Use local Data"
	let sortButtonTitle = "Sort by First Name"

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
						.init(astronaut: astronaut,
							  astronautsService: astronautsService)
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

		astronautCellViewModels.sort { lhs, rhs in
			lhs.name < rhs.name
		}
	}

	func reloadWithLocalData() async {
		astronautsService = AstronautsPreviewClient()
		state = .fetching
		await start()
	}

}
