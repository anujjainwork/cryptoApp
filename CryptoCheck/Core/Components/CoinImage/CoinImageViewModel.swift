//
//  CoinImageViewModel.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 26/01/25.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let imageDataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageDataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        imageDataService.$image
            .sink {
                [weak self] (_) in
                       self?.isLoading = false
            } receiveValue: {
                [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
