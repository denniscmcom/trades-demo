//
//  ContentView.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tab: Tab = .explorer
    
    private enum Tab {
        case explorer, popular, details
    }
    
    var body: some View {
        TabView(selection: $tab) {
            Explorer()
                .tabItem {
                    Label("Explorer", systemImage: "magnifyingglass")
                }
                .tag(Tab.explorer)
            
            Popular()
                .tabItem {
                    Label("Popular", systemImage: "eyes")
                }
            
            Details(company: CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL"))
                .tabItem {
                    Label("Details", systemImage: "chart.pie")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
