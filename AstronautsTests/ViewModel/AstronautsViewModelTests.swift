//
//  AstronautsViewModelTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

@testable import Astronauts
import XCTest

final class AstronautsViewModelTests: XCTestCase {

	func testViewModel() throws {

		let viewModel = AstronautsViewModel()
		XCTAssertFalse(viewModel.astronauts.isEmpty)

		let astronaut = try XCTUnwrap(viewModel.astronauts.first)
		XCTAssertEqual(astronaut.name, "Michael Collins")

	}

}
