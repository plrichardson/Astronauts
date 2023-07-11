//
//  AstronautsView.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautsView: View {

	@ObservedObject private(set) var viewModel: AstronautsViewModel

	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: [GridItem()], spacing: 20.0) {
					switch viewModel.state {
					case .fetching:
						ProgressView()
					case .data:
						Button("Sort by First Name") {
							viewModel.sort()
						}
						.padding()
						.foregroundColor(.white)
						.background(Color.accentColor)
						.clipShape(Capsule())
						ForEach(viewModel.astronautCellViewModels) { cellViewModel in
							NavigationLink {
								AstronautDetailView(
									viewModel: AstronautDetailViewModel(
										astronautsService: AstronautsClient(),
										id: cellViewModel.id
									)
								)
							} label: {
								AstronautCellView(
									viewModel: cellViewModel
								)
							}
						}
					case .error(message: let message):
						Text(message)
					}
				}
				.padding()
			}
			.navigationTitle (viewModel.navigationTitle)
		}
		.task {
			await viewModel.start()
		}

	}

	init(viewModel: AstronautsViewModel) {
		self.viewModel = viewModel
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
	}

}

struct AstronautsView_Previews: PreviewProvider {
	static var previews: some View {
		AstronautsView(
			viewModel: AstronautsViewModel(
				astronautsService: AstronautsPreviewClient()
			)
		)
	}
}
