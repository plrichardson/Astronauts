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
				ForEach(viewModel.astronautCellViewModels) { cellViewModel in
					NavigationLink {
						AstronautDetailView(
							viewModel: AstronautDetailViewModel(
								astronautsService: AstronautsPreviewClient(),
								id: cellViewModel.id
							)
						)
					} label: {
						AstronautCellView(
							viewModel: cellViewModel
						)
					}

				}
			}
			.padding()
			.navigationTitle (viewModel.navigationTitle)
		}
		.task {
			await viewModel.start()
		}

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
