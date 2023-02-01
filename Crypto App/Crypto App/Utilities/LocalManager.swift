//
//  LocalManager.swift
//  Crypto App
//
//  Created by Danil Bochkarev on 23.01.2023.
//

import Foundation
import SwiftUI

class LocalManager {
    static let instance = LocalManager()
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        createFolder(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderNJame: folderName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, folderNJame: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolder(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil}
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderNJame: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderNJame) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
