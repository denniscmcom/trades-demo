//
//  Company.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI
import StockCharts

struct Company: View {
    var company: CompanyModel
    let randomDataManager = RandomDataManager()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(Color(.secondarySystemBackground))
            .frame(width: 170, height: 230)
            .overlay(
                VStack(alignment: .leading) {
                    Group {
                        Text(company.symbol)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top)
                        
                        Text(company.name)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        
                        Text("\(company.price, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    let data = randomDataManager.create()
                    let lineChartStyle = LineChartStyle(
                        labelColor: Color(.systemBlue),
                        indicatorPointColor: Color(.systemTeal),
                        showingIndicatorLineColor: Color(.systemBlue),
                        flatTrendLineColor: Color(.systemTeal),
                        uptrendLineColor: Color(.systemGreen),
                        downtrendLineColor: Color(.systemRed)
                    )
                    
                    LineChartView(
                        data: data,
                        dates: nil,
                        hours: nil,
                        dragGesture: false,
                        style: lineChartStyle
                    )
                    .padding(.bottom, 5)
                }
                , alignment: .leading
            )
    }
}

struct Company_Previews: PreviewProvider {
    static var previews: some View {
        Company(
            company: CompanyModel(
                name: "Apple Inc.",
                price: 120.30,
                symbol: "AAPL"
            )
        )
    }
}
