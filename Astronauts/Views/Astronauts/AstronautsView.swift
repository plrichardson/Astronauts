//
//  AstronautsView.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautsView: View {

	var viewModel: AstronautsViewModel

    var body: some View {
		NavigationView {
			ScrollView{
				ForEach(viewModel.astronauts) { astronaut in
					NavigationLink {
						AstronautDetailView(viewModel: AstronautDetailViewModel())
					} label: {
						AstronautCellView(
							viewModel: AstronautCellViewModel(astronaut: astronaut)
						)
					}

				}
			}
			.padding()
			.navigationTitle (viewModel.navigationTitle)
		}
    }

}

struct AstronautsView_Previews: PreviewProvider {
    static var previews: some View {
		AstronautsView(viewModel: AstronautsViewModel())
    }
}
