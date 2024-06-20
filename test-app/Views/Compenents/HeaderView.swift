//
//  HeaderView.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isAddReviewFormDisplayed: Bool
    private let title = "Reviews"
    private let buttonTitle = "Add a review"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            
            Spacer()
            
            Button {
                isAddReviewFormDisplayed = true
            } label: {
                Text(buttonTitle)
            }
        }
        .padding(20)
    }
}

#Preview {
    HeaderView(isAddReviewFormDisplayed: .constant(false))
}
