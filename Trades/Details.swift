//
//  Details.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI
import StockCharts

struct Details: View {
    var company: CompanyModel
    let randomDataManager = RandomDataManager()
    
    @State private var dates = ["1D", "5D", "1W", "3M", "6M", "1Y"]
    @State private var selectedDate = "3M"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(.secondarySystemBackground))
                        .frame(height: 300)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("\(company.symbol) is trading at \(company.price, specifier: "%.2f")")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding()
                                
                                LineChartView(
                                    lineChartController:
                                        LineChartController(
                                            prices: randomDataManager.create(),
                                            dragGesture: true
                                        )
                                )
                                    .padding(.bottom)
                            }
                            ,alignment: .leading
                        )
                    
                    Picker("Please choose a date", selection: $selectedDate) {
                        ForEach(dates, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Divider()
                    Text("\(company.name)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    let description = """
                    Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software, and online services.Apple is the world's largest technology company by revenue (totaling $274.5 billion in 2020) and, since January 2021, the world's most valuable company. As of 2021, Apple is the world's fourth-largest PC vendor by unit sales, and fourth-largest smartphone manufacturer. It is one of the Big Five American information technology companies, along with Amazon, Google, Microsoft, and Facebook.

                    Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne in 1976 to develop and sell Wozniak's Apple I personal computer. It was incorporated by Jobs and Wozniak as Apple Computer, Inc. in 1977, and sales of its computers, including the Apple II, grew quickly. They went public in 1980 to instant financial success. Over the next few years, Apple shipped new computers featuring innovative graphical user interfaces, such as the original Macintosh, announced with the critically acclaimed advert "1984". However, the high price of its products and limited application library caused problems, as did power struggles between executives. In 1985, Wozniak departed Apple amicably,[15] while Jobs resigned to found NeXT, taking some Apple co-workers with him.
                    """
                    
                    Text(description)
                        .multilineTextAlignment(.leading)
                }
                .padding()
            }
            .navigationTitle("Details")
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(
            company: CompanyModel(
                name: "Apple Inc.",
                price: 120.30,
                symbol: "AAPL"
            )
        )
    }
}
