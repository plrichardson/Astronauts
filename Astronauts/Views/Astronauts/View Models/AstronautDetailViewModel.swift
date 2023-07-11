//
//  AstronautDetailViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

@MainActor
final class AstronautDetailViewModel: ObservableObject {

	// MARK: - Types

	enum State {
		case fetching
		case data
		case error(message: String)
	}

	// MARK: - Properties

	let astronautsService: AstronautsService

	@Published private(set) var state: State = .fetching
	@Published private(set) var astronaut: Astronaut?

	var id: Int

	var name: String? {
		astronaut?.name
	}

	var nationality: String? {
		astronaut?.nationality
	}

	var bio: String? {
		astronaut?.bio
	}

	var imageUrl: URL? {
		guard let urlString = astronaut?.imageUrl else  {
			return nil
		}
		return URL(string: urlString)
	}

	var dob: String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		if let dob = astronaut?.dob,
		   let date = dateFormatter.date(from: dob) {
			dateFormatter.dateFormat = "MMMM d, yyyy"
			return dateFormatter.string(from: date)
		}
		return astronaut?.dob
	}

	// MARK: - Initialization

	init(astronautsService: AstronautsService,
		 id: Int) {
		self.astronautsService = astronautsService
		self.id = id
	}

	// MARK: - Public API

	func start() async {
		do {
			let astronaut = try await astronautsService.fetchAstronaut(id: id)
			self.astronaut = astronaut
			state = .data
		} catch {
			state = .error(message: "Astronauts is unable to fetch data: \(error)")
		}
	}

}

