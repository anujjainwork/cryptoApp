//
//  HomeView.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 22/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack{
                header
                columnTitles
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    allPortfolioCoins
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView{
    var header: some View{

            HStack{
                    CircleButtonView(iconName: showPortfolio ? "plus" :"info")
                        .animation(.none)
                        .background(
                            CircleButtonAnimationView(animate: $showPortfolio)
                        )
                Spacer()
                    Text(showPortfolio ? "Portfolio" : "Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.theme.accent)
                        .animation(.none)
                Spacer()
                CircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle ( degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()){
                            showPortfolio.toggle()
                        }
                    }
            }
            .padding(.horizontal)
    }
    
    var allCoinsList: some View{
        List{
            ForEach(vm.allCoins){
                coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    var allPortfolioCoins: some View{
        List{
            ForEach(vm.portfolioCoins){
                coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    var columnTitles : some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width/3.5,alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
