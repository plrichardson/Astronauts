//
//  AstronautDetailViewModelTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

@testable import Astronauts
import XCTest

final class AstronautDetailViewModelTests: XCTestCase {

	func testViewModel() throws {

		let viewModel = AstronautDetailViewModel()

		XCTAssertEqual(viewModel.id, 38)
		XCTAssertEqual(viewModel.name, "Michael Collins")

	}

}
