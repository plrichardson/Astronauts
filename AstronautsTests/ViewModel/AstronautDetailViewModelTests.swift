//
//  AstronautDetailViewModelTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

@testable import Astronauts
import XCTest

final class AstronautDetailViewModelTests: XCTestCase {

	func testViewModel() async throws {

		let viewModel = AstronautDetailViewModel(
			astronautsService: AstronautsPreviewClient(),
			id: 38)

		await viewModel.start()

		XCTAssertEqual(viewModel.id, 38)
		XCTAssertEqual(viewModel.name, "Michael Collins")

	}

}
