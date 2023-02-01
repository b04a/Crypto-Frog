//
//  DetailViewModel.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 30.01.2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    @Published var overviewStatistic: [StaticModel] = []
    @Published var additionalStatistic: [StaticModel] = []
    @Published var webURL: String? = nil
    @Published var redditURL: String? = nil
    @Published var coinDescriptor: String? = nil
    
    
    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubs()
    }
    
    private func addSubs() {
        coinDetailService.$coinDetail
            .combineLatest($coin)
            .map(mapDataToStatistic)
            .sink { [weak self] returnedArrays in
                self?.overviewStatistic = returnedArrays.overview
                self?.additionalStatistic = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailService.$coinDetail
            .sink { [weak self] returnedCoinDetail in
                self?.coinDescriptor = returnedCoinDetail?.readableDescription
                self?.webURL = returnedCoinDetail?.links?.homepage?.first
                self?.redditURL = returnedCoinDetail?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistic(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StaticModel], additional: [StaticModel]) {

        let overviewArray = createOverview(coinModel: coinModel)
        let additionalArray = createAdditional(coinDetailModel: coinDetailModel, coinModel: coinModel)
       
        
        return (overviewArray, additionalArray)
    }
    
    func createOverview(coinModel: CoinModel) -> [StaticModel] {
        let price = coinModel.currentPrice.asCurrentWith5Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StaticModel(title: "Current Price", value: price, percentChange: pricePercentChange)
        
        let marketCap = "$" +  (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StaticModel(title: "Market Cap", value: marketCap, percentChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StaticModel(title: "Rank", value: rank)
        
        let volume = "$" +  (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StaticModel(title: "Volume", value: volume)
        
        let overviewArray: [StaticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray
    }
    
    private func createAdditional(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StaticModel] {
        let high = coinModel.high24H?.asCurrentWith5Decimals() ?? "n/a"
        let highStat = StaticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrentWith5Decimals() ?? "n/a"
        let lowStat = StaticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrentWith5Decimals() ?? "n/a"
        let pricePercentChange2 = coinModel.priceChangePercentage24H
        let pricePercentChangeStat = StaticModel(title: "24h Price Change", value: priceChange, percentChange: pricePercentChange2)
        
        let marketCapChange = "$" +  (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StaticModel(title: "24h Market Cap Change", value: marketCapChange, percentChange: marketCapPercentChange2)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = StaticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = StaticModel(title: "Hashing Algorith", value: hashing)

        let additionalArray: [StaticModel] = [
            highStat, lowStat, pricePercentChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray
    }
}
