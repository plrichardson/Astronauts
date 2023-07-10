//
//  AstronautsViewModelTests.swift
//  AstronautsTests
//
//  Created by Paul Richardson on 10/7/2023.
//

@testable import Astronauts
import XCTest

final class AstronautsViewModelTests: XCTestCase {

	@MainActor func testViewModel() async throws {

		let viewModel = AstronautsViewModel(astronautsService: AstronautsPreviewClient())
		await viewModel.start()
		let cellViewModels = viewModel.astronautCellViewModels
		XCTAssertFalse(cellViewModels.isEmpty)

		let cellViewModel = try XCTUnwrap(cellViewModels.first)
		XCTAssertEqual(cellViewModel.name, "Michael Collins")

	}

}
