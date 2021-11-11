//
//  ContentView.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                NavigationTitlesView(mainTitle: "Stocks",
                                     subTitle: "Nov 10 2021")
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
