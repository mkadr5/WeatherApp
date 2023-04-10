//
//  ContentView.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 9.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isSplash = false
   
    var body: some View {
        SplashScreen().onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.isSplash = true
            }
        }.fullScreenCover(isPresented: $isSplash, content: {
            if UserDefaults.standard.bool(forKey: "tutorial") {
                HomeView()
            } else {
                TutorialView()
            }
        })
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
