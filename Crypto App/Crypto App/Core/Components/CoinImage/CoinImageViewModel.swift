//
//  CoinImageViewModel.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 23.01.2023.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    private let coin: CoinModel
    private let dataService: CoinImageServices
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageServices(coin: coin)
        self.addSubs()
        self.isLoading = true
    }
    
    private func addSubs() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
