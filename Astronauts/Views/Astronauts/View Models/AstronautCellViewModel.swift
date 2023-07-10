//
//  AstronautCellViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautCellViewModel {
	var name: String
	var nationality: String
	var imageUrl: String

	var image: UIImage? {
		get {
			if let url = URL(string: imageUrl),
			   let data = try? Data(contentsOf: url) {
				return UIImage(data: data)
			}
			return nil
		}
	}

	init(astronaut: Astronauts.Astronaut) {
		self.name = astronaut.name
		self.nationality = astronaut.nationality
		self.imageUrl = astronaut.imageUrl
	}
}

