//
//  AstronautsTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

import XCTest
@testable import Astronauts

final class AstronautsTests: XCTestCase {

    override func setUpWithError() throws {

	}

    override func tearDownWithError() throws {

	}

	func testAstronautsDecoding() throws {
		let data = Astronauts.preview
		XCTAssertEqual(data.astronauts.count, 10)
	}
}
