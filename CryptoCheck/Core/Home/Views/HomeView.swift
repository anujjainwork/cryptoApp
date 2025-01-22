//
//  HomeView.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 22/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack{
            header
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
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
}
