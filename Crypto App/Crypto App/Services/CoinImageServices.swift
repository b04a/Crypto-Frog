//
//  CoinImageServices.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 23.01.2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageServices {
    @Published var image: UIImage? = nil
    private var imageSub: AnyCancellable?
    private let coin: CoinModel
    private let filemanager = LocalManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveimage = filemanager.getImage(imageName: imageName, folderName: folderName) {
            image = saveimage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSub = NetworkManager.downloasd(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleComplition, receiveValue: { [weak self] receiveImage in
                guard let self = self, let downloadedImage = receiveImage else { return }
                self.image = downloadedImage
                self.imageSub?.cancel()
                self.filemanager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
