//
//  AstronautDetailViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

final class AstronautDetailViewModel: ObservableObject {

	// MARK: - Properties

	let astronautsService: AstronautsService

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

	var image: UIImage? {
		get {
			if let imageUrl = imageUrl,
			   let url = URL(string: imageUrl),
			   let data = try? Data(contentsOf: url) {
				return UIImage(data: data)
			}
			return nil
		}
	}

	// MARK: - Initialization

	init(astronautsService: AstronautsService,
		 id: Int) {
		self.astronautsService = astronautsService
//		self.id = id
		self.id = 38
	}

	// MARK: - Public API

	func start() async {
		do {
			let astronaut = try await astronautsService.fetchAstronaut(id: id)
			self.astronaut = astronaut
		} catch {
			print("Unable to fetch Astronaut \(id)")
		}

	}

}

