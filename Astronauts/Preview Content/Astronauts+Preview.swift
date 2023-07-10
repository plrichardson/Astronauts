//
//  Astronauts+Preview.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import Foundation

extension Astronauts {

	static var preview: Self {
		let bundle = Bundle.main
		let url = bundle.url(forResource: "astronauts", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		return try! JSONDecoder().decode(Astronauts.self, from: data)
	}
}
