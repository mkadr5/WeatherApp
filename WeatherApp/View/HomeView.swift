//
//  HomeView.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 10.04.2023.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingSidemenu = false
    @State private var selectedTab = 0 // Seçili olan sekmenin index'i
    
    let tabs = ["First", "Second", "Third"] // Sekme isimleri dizisi
    var body: some View {
        NavigationView{
            VStack{
                //background herşeyin üstüne geliyor iyice incele sorunlar var navigationbaritems da sıkıntılar olabilir
                SideMenu(isShowingMenu: $isShowingSidemenu)
            }.frame(width: 100.w,height: 90.h)
            .navigationBarItems(leading: HStack{
                Button(action: {
                    self.isShowingSidemenu = true
                }) {
                    Image(systemName: "list.bullet")
                        .font(Font.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                }
                Spacer()
                Text("Tamil Nadu, Chennai").font(.title3).fontWeight(.bold).foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis").font(Font.system(size: 16, weight: .bold)).rotationEffect(Angle(degrees: 90)).foregroundColor(.white)
            }.frame(width: 90.w).opacity(isShowingSidemenu ? 0 : 1))
            
            .background(LinearGradient(colors: [.linearColor1,.linearColor2], startPoint: .top, endPoint: .bottom))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
