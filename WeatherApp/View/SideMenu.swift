//
//  SideMenu.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 15.04.2023.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowingMenu :Bool
    var body: some View {
        
        VStack{
            HStack{
                Image("people").resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 5))
                    .shadow(radius: 15)
                    .frame(width: 48,height: 48).padding(.leading,5.w)
                Text("Sign in").foregroundColor(.white).font(.title3).fontWeight(.bold).padding(.leading)
                Spacer()
                Button {
                    withAnimation {
                        self.isShowingMenu = false
                    }
                } label: {
                    Image(systemName: "xmark").foregroundColor(.white).padding()
                }
            }.frame(width: 80.w,height: 10.h)
                .overlay(Rectangle().fill(Color.color1).frame(height: 0.1),alignment: .bottom)
                .padding()
            
            Spacer()
        }.frame(width: 80.w,height: 100.h)
        .background(LinearGradient(colors: [.linearColor4,.linearColor3], startPoint: .top, endPoint: .bottom))
        .shadow(color: .black.opacity(isShowingMenu ? 0.7 : 0), radius: 20,x: 10,y: 0)
        //.opacity(isShowingMenu ? 1 : 0)
        .offset(x: isShowingMenu ? 0 : -80.w)
        .animation(.default)
        .padding(.trailing,20.w)
        
        
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    
    static var previews: some View {
        SideMenu(isShowingMenu: Binding.constant(true))
    }
}
