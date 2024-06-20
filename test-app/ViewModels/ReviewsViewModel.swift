//
//  ReviewsViewModel.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import Foundation

class ReviewsViewModel: ObservableObject {
    @Published var reviews = [Review]()
    let apiService = ApiService()
    
    init() {
        // Subscribe to listen when a review is added to the "database"
        NotificationCenter.default.addObserver(self, selector:#selector(fetchAllReviews), name: NSNotification.Name("reviewAdded"), object: nil)
        
        fetchAllReviews()
    }
    
    @objc func fetchAllReviews() {
        reviews = apiService.getReviews()
    }
    
    func sendReview(_ review : Review) {
        apiService.postReview(review)
    }
    
    deinit {
        // Unsubscribe listeners to prevent memory leaks
        NotificationCenter.default.removeObserver(self, name:  NSNotification.Name("reviewAdded"), object: nil)
    }
}
