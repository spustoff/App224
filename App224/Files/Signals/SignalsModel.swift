//
//  SignalsModel.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct DiscoveryModel: Codable, Hashable {
    
    var results: [DiscoveryItem]
}

struct DiscoveryItem: Codable, Hashable {
    
    var resultHash, resultInstrument, resultPeriod: String
    
    var resultTp, resultSl, resultP: Double
    
    var resultSignal, resultDate: String
}
