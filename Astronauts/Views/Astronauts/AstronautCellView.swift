//
//  AstronautCellView.swift
//  Astronauts
//
//  Created by Paul Richardson on 10/7/2023.
//

import SwiftUI

struct AstronautCellView: View {

	@ObservedObject private(set) var viewModel: AstronautCellViewModel

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(viewModel.name)
					.font(.headline)
					.foregroundColor(.accentColor)
				Text(viewModel.nationality)
					.font(.subheadline)
				Spacer()
			}
			Spacer()
			if let image = viewModel.image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 100)
					.clipShape(Circle())
			}
		}
		.padding()
		.overlay {
			RoundedRectangle(cornerRadius: 10.0)
				.stroke(Color.gray)
				.opacity(0.25)
		}
		.task {
			await viewModel.start()
		}
	}

}

struct AstronautCellView_Previews: PreviewProvider {
	static var previews: some View {
		AstronautCellView(
			viewModel: AstronautCellViewModel(
				astronaut: Astronauts.preview.astronauts[0],
				astronautsService: AstronautsPreviewClient())
		)
	}
}
