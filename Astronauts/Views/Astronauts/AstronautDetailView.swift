//
//  AstronautDetailView.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautDetailView: View {
	
	@ObservedObject private(set) var viewModel: AstronautDetailViewModel
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				switch viewModel.state {
				case .fetching:
					ProgressView()
				case .data:
					if let name = viewModel.name,
					   let nationality = viewModel.nationality,
					   let dob = viewModel.dob ,
					   let bio = viewModel.bio {
						Text(name)
							.font(.title)
						if let image = viewModel.image {
							Image(uiImage: image)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 250)
								.clipShape(RoundedRectangle(cornerRadius: 5.0))
						}
						Text("\(nationality), born \(dob)")
							.font(.subheadline)
							.padding(.bottom)
						Text(bio)
							.font(.body)
						Spacer()
					}
				case .error(message: let message):
					Text(message)
				}
			}
			.padding()
		}
		.task {
			await viewModel.start()
		}
	}
}

struct AstronautDetailView_Previews: PreviewProvider {
	static var previews: some View {
		AstronautDetailView(
			viewModel: AstronautDetailViewModel(
				astronautsService: AstronautsPreviewClient(),
				id: 34))
	}
}
