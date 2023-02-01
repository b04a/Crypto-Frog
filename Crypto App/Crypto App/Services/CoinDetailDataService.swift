//
//  CoinDetailDataService.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 30.01.2023.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetail: CoinDetailModel? = nil
    //var cancellebles = Set<AnyCancellable>()
    var coinSub: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinSub = NetworkManager.downloasd(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleComplition, receiveValue: { [weak self] receiveCoinsDetails in
                self?.coinDetail = receiveCoinsDetails
                self?.coinSub?.cancel()
            })
    }
}


