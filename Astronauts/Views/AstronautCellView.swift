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
			if let imageUrl = viewModel.imageUrl {
				AsyncImage(url: imageUrl,
						   transaction: Transaction(animation: .easeInOut)
						   ) { phase in
					switch phase {
					case .empty:
						ProgressView()
					case .success(let image):
						image
							.resizable()
							.aspectRatio(contentMode: .fit)
							.transition(.scale(scale: 0.5, anchor: .center))
					case .failure:
						Image(systemName: "wifi.slash")
					@unknown default:
						EmptyView()
					}
				}
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
