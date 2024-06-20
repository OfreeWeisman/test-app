//
//  AddReviewForm.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct AddReviewForm: View {
    let reviewsViewModel: ReviewsViewModel
    let dismiss: () -> ()
    private let title = "Add a review"
    private let titleHint = "Title..."
    private let contentHint = "Tell us more..."
    private let fillMissingFieldsMessage = "Please fill out the missing fields"
    private let buttonTitle = "Send"
    @State private var reviewTitle = ""
    @State private var reviewContent = ""
    @State private var rating = 0
    @State private var showFillMissingInfoMessage = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)

            StarsIndicatorsView(isReadOnly: false, rating: $rating)
                .padding()
            
            TextField(titleHint, text: $reviewTitle)
                .autocorrectionDisabled()
                .padding()
            
            TextField(contentHint, text: $reviewContent, axis: .vertical)
                .autocorrectionDisabled()
                .padding()
                        
            Spacer()
            
            if (showFillMissingInfoMessage) {
                Text(fillMissingFieldsMessage)
                    .foregroundColor(.red)
            }
            
            Button {
                let review = Review(id: UUID().hashValue, title: reviewTitle, content: reviewContent, rating: rating)
                if (review.title.isEmpty || review.content.isEmpty) {
                    showFillMissingInfoMessage = true

                } else {
                    reviewsViewModel.sendReview(review)
                    dismiss()
                }

            } label: {
                Text(buttonTitle)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.blue)
                    )
            }
        }
        .padding(20)
    }
}

#Preview {
    AddReviewForm(reviewsViewModel: ReviewsViewModel(), dismiss: {})
}
