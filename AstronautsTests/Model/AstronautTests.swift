//
//  AstronautTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

import XCTest
@testable import Astronauts

final class AstronautTests: XCTestCase {

	override func setUpWithError() throws {

	}

	override func tearDownWithError() throws {

	}

	func testAstronautDecoding() throws {
		let data = Astronaut.preview
		XCTAssertEqual(data.id, 38)
	}
}
