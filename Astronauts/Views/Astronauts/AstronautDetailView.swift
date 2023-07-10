//
//  AstronautDetailView.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautDetailView: View {

	var viewModel: AstronautDetailViewModel

	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text(viewModel.name)
					.font(.title)
				if let foo = viewModel.image {
					Image(uiImage: foo)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 250)
						.clipShape(RoundedRectangle(cornerRadius: 5.0))
				}
				Text("\(viewModel.nationality), born \(viewModel.dob)")
					.font(.subheadline)
					.padding(.bottom)
				Text(viewModel.bio)
					.font(.body)
				Spacer()
			}
			.padding()
		}
	}
}

struct AstronautDetailView_Previews: PreviewProvider {
	static var previews: some View {
		AstronautDetailView(viewModel: AstronautDetailViewModel())
	}
}
