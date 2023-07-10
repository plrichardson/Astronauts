//
//  AstronautDetailViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct AstronautDetailViewModel {

	let astronaut = Astronaut.preview

	var id: Int
	var name: String
	var nationality: String
	var bio: String
	var imageUrl: String
	var dob: String

	init(astronaut: Astronaut = Astronaut.preview) {
		self.id = astronaut.id
		self.name = astronaut.name
		self.nationality = astronaut.nationality
		self.bio = astronaut.bio
		self.imageUrl = astronaut.imageUrl
		self.dob = astronaut.dob
	}

}
