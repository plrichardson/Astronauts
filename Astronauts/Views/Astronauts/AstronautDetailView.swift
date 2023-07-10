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
			if let name = viewModel.name,
			   let image = viewModel.image,
			   let nationality = viewModel.nationality,
			   let dob = viewModel.dob ,
			   let bio = viewModel.bio {
				VStack(alignment: .leading) {
					Text(name)
						.font(.title)
					Image(uiImage: image)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 250)
						.clipShape(RoundedRectangle(cornerRadius: 5.0))
					Text("\(nationality), born \(dob)")
						.font(.subheadline)
						.padding(.bottom)
					Text(bio)
						.font(.body)
					Spacer()
				}
				.padding()
			} else {
				ProgressView()
			}
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
