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
					if let nationality = viewModel.nationality,
					   let dob = viewModel.dob,
					   let bio = viewModel.bio,
					   let imageUrl = viewModel.imageUrl {
						AsyncImage(
							url: imageUrl,
							transaction: Transaction(animation: .easeInOut)
						) { phase in
							switch phase {
							case .empty:
								ProgressView()
							case .success(let image):
								image
									.resizable()
									.aspectRatio(contentMode: .fit)
									.transition(.scale(scale: 0.1, anchor: .center))
							case .failure:
								Image(systemName: "wifi.slash")
							@unknown default:
								EmptyView()
							}
						}
						.frame(width: 250)
						.background(Color.gray)
						.clipShape(RoundedRectangle(cornerRadius: 5.0))

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
		.navigationTitle(viewModel.name ?? "")
		.task {
			await viewModel.start()
		}
	}

	init(viewModel: AstronautDetailViewModel) {
		self.viewModel = viewModel
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
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
