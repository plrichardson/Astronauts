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

	@Published private(set) var image: UIImage?

	private let astronautsService: AstronautsService

	var id: Int
	var name: String
	var nationality: String
	var imageUrl: String

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
		self.imageUrl = astronaut.imageUrl
		self.astronautsService = astronautsService
	}

	fileprivate func loadImage() async {
		let session = URLSession.shared
		if let url = URL(string: imageUrl) {
			do {
				let (data, _) = try await session.data(from: url)
				self.image = .init(data: data)
			} catch {
				print("Invalid data")
			}
		}
	}

	func start() async {
		await loadImage()
	}
}

