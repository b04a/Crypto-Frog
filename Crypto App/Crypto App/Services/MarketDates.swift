//
//  MarketDates.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 24.01.2023.
//

import Foundation

import Foundation
import Combine

class MarketDateService {
    @Published var marketData: MarketDataModel? = nil
    var marketDataSub: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSub = NetworkManager.downloasd(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleComplition, receiveValue: { [weak self] receiveGlobalData in
                self?.marketData = receiveGlobalData.data
                self?.marketDataSub?.cancel()
            })
    }
}
