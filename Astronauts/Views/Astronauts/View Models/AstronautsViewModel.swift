//
//  AstronautsViewModel.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

struct AstronautsViewModel {
	let navigationTitle = "Astronauts"
	var astronauts: [Astronauts.Astronaut] = Astronauts.preview.astronauts
}
