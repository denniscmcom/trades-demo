//
//  RandomDataManager.swift
//  Trades
//
//  Created by Dennis Concepción Martín on 5/8/21.
//

import SwiftUI
import GameplayKit

class RandomDataManager {
    func create() -> [Double] {
        let distribution = GKGaussianDistribution(lowestValue: 10, highestValue: 100)
        var prices: [Double] = []
        for _ in (1..<80) {
            prices.append(Double(distribution.nextInt()))
        }
        
        return prices
    }
}
