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
		VStack {
			Text(viewModel.name)
			Text(viewModel.nationality)
			Text(viewModel.dob)
			Text(viewModel.bio)
			Spacer()
		}
		.padding()
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautDetailView(viewModel: AstronautDetailViewModel())
    }
}
