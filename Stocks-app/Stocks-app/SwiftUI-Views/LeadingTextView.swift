//
//  LeadingTextView.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/9/21.
//

import SwiftUI

struct LeadingTextView: View {
    
    var textName: String
    var size: CGFloat = 10
    var weight: Font.Weight = .medium
    var color: Color = .white
    
    var body: some View {
        HStack {
            Text(textName)
                .font(.system(size: size, weight: weight))
                .foregroundColor(color)
            Spacer()
        }
    }
}
