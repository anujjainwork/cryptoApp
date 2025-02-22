//
//  HomeViewModel.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 24/01/25.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject{
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    
    private var cancellables  = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$allCoins
            .sink{ [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
        }
            .store(in: &cancellables)
    }
}
