//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        
    }
}

#Preview {
    MainView()
}
