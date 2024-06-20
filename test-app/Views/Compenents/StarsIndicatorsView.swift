//
//  StarsIndicatorsView.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct StarsIndicatorsView: View {
    let isReadOnly: Bool
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                if (isReadOnly) {
                    StarView(isFilled: index <= rating, isReadOnly: isReadOnly)
                } else {
                    Button {
                        rating = index
                    } label : {
                        StarView(isFilled: index <= rating, isReadOnly: isReadOnly)
                    }
                }
            }
        }
    }
}

#Preview {
    StarsIndicatorsView(isReadOnly: false, rating: .constant(3))
}
