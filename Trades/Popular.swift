//
//  Popular.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI
import StockCharts

struct Popular: View {
    let jsonManager = JsonManager()
    let randomDataManager = RandomDataManager()
    
    var body: some View {
        NavigationView {
            List {
                let popular: [CompanyModel] = jsonManager.read("Popular.json")
                ForEach(popular, id: \.self) { company in
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(company.symbol)
                                .fontWeight(.semibold)
                            
                            Text(company.name)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        .padding(.trailing)
                        
                        Spacer()
                        
                        let prices = randomDataManager.create()
                        LineChartView(lineChartController: LineChartController(prices: prices))
                            .frame(width: 150)
                        
                            Text("\(company.price, specifier: "%.2f")")
                                .fontWeight(.semibold)
                                .padding(.leading)
                    }
                }
            }
            .navigationTitle("Popular")
        }
    }
}

struct Popular_Previews: PreviewProvider {
    static var previews: some View {
        Popular()
    }
}
