//
//  ContentView.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var reviewsViewModel = ReviewsViewModel()
    @State var isAddReviewFormDisplayed = false
    
    var body: some View {
        VStack {
            HeaderView(isAddReviewFormDisplayed: $isAddReviewFormDisplayed)
            
            if reviewsViewModel.reviews.isEmpty {
                Text("No reviews were posted yet")
                Spacer()
            } else {
                ScrollView {
                    ForEach(reviewsViewModel.reviews, id: \.id) { review in
                        ReviewView(review: review, rating: review.rating)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .sheet(isPresented: $isAddReviewFormDisplayed, onDismiss: { isAddReviewFormDisplayed = false }) {
            AddReviewForm(reviewsViewModel: reviewsViewModel, dismiss: { isAddReviewFormDisplayed = false })
        }
    }
}

#Preview {
    ContentView()
}
