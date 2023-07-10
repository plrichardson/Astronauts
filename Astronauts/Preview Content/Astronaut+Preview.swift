//
//  Astronaut+Preview.swift
//  Astronaut
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

extension Astronaut {

	static var preview: Self {
		let bundle = Bundle.main
		let url = bundle.url(forResource: "astronaut", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		return try! JSONDecoder().decode(Astronaut.self, from: data)
	}
}
