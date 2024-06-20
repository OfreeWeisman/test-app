//
//  ReviewView.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct ReviewView: View {
    let review: Review
    @State var rating: Int
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text(review.title)
                .font(.title2)
                .padding(.bottom, 4)
            
            StarsIndicatorsView(isReadOnly: true, rating: $rating)
                .padding(.bottom, 10)
            
            Text(review.content)
                .font(.subheadline)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
        )
        
    }
}

#Preview {
    ReviewView(review: Review(id: 1, title: "My review", content: "I like this app I like this", rating: 4), rating: 3)
}
