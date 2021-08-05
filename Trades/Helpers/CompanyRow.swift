//
//  CompanyRow.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI

struct CompanyRow: View {
    var companies: [CompanyModel]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(companies, id: \.self) { company in
                        Company(company: company)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .listRowInsets(EdgeInsets())
    }
}

struct MostActiveRow_Previews: PreviewProvider {
    static var previews: some View {
        CompanyRow(
            companies: [
                CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL"),
                CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL"),
                CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL"),
                CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL"),
                CompanyModel(name: "Apple Inc.", price: 120.30, symbol: "AAPL")
            ],
            title: "Most Active"
        )
    }
}
