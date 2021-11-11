//
//  NavigationTitlesView.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/9/21.
//

import SwiftUI

struct NavigationTitlesView: View {
    
    var mainTitle: String
    var subTitle: String
    
    var body: some View {
        VStack {
            LeadingTextView(textName: mainTitle,
                            size: 50,
                            weight: .bold,
                            color: .white)
            
            LeadingTextView(textName: subTitle,
                            size: 30,
                            weight: .medium,
                            color: .gray)
        }
        .padding(EdgeInsets.init(top: 100,
                                 leading: 50,
                                 bottom: 0,
                                 trailing: 0))
    }
}
