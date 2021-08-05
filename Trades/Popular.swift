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
                        
                        let data = randomDataManager.create()
                        let lineChartStyle = LineChartStyle(
                            labelColor: Color(.systemBlue),
                            indicatorPointColor: Color(.systemTeal),
                            showingIndicatorLineColor: Color(.systemBlue),
                            flatTrendLineColor: Color(.systemTeal),
                            uptrendLineColor: Color(.systemGreen),
                            downtrendLineColor: Color(.systemRed)
                        )
                        
                        Spacer()
                        
                        LineChartView(
                            data: data,
                            dates: nil,
                            hours: nil,
                            dragGesture: false,
                            style: lineChartStyle
                        )
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
