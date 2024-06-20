//
//  StarView.swift
//  test-app
//
//  Created by Ofree Weisman on 20/06/2024.
//

import SwiftUI

struct StarView: View {
    let isFilled: Bool
    let isReadOnly: Bool

    var body: some View {
        Image(systemName: isFilled ? "star.fill" : "star")
            .foregroundColor(isReadOnly ? .yellow : .blue)
    }
}

#Preview {
    StarView(isFilled: true, isReadOnly: false)
}
