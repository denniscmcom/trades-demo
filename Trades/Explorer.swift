//
//  Explorer.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI

struct Explorer: View {
    let jsonManager = JsonManager()
    
    var body: some View {
        NavigationView {
            List {
                let mostActive: [CompanyModel] = jsonManager.read("MostActive.json")
                CompanyRow(companies: mostActive, title: "Most Active")
                
                let gainer: [CompanyModel] = jsonManager.read("Gainers.json")
                CompanyRow(companies: gainer, title: "Gainers")
                
                let losers: [CompanyModel] = jsonManager.read("Losers.json")
                CompanyRow(companies: losers, title: "Losers")
            }
            .navigationTitle("Explorer")
        }
    }
}

struct Explorer_Previews: PreviewProvider {
    static var previews: some View {
        Explorer()
    }
}
