//
//  AstronautDetailViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

@MainActor
final class AstronautDetailViewModel: ObservableObject {

	// MARK: - Properties

	let astronautsService: AstronautsService

	@Published private(set) var astronaut: Astronaut?
	@Published private(set) var image: UIImage?

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

	var imageUrl: String? {
		astronaut?.imageUrl
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
			await loadImage()
		} catch {
			print("Unable to fetch Astronaut \(id): \(error)")
		}

	}

	fileprivate func loadImage() async {
		guard let imageUrl = imageUrl else {
			return
		}

		let session = URLSession.shared
		if let url = URL(string: imageUrl) {
			do {
				let (data, _) = try await session.data(from: url)
				self.image = UIImage(data: data)
			} catch {
				print("Invalid data")
			}
		}
	}


}

