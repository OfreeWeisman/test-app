//
//  ApiService.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import Foundation

class ApiService {

    var reviewsDB = [Review]()
    
    func getReviews() -> [Review] {
        return reviewsDB
    }
    
    func postReview(_ review: Review) {
        reviewsDB.insert(review, at: 0)
        
        // Usually I would assume I will get a push from BE that the DB was updated and I should fetch the new reviews, but here is a solution for local updates
        // Notify that a review was added
        NotificationCenter.default.post(name: NSNotification.Name("reviewAdded"), object: nil)
    }
}
