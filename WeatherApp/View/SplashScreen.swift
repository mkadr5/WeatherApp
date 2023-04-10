//
//  SplashScreen.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 10.04.2023.
//

import SwiftUI

struct SplashScreen: View {
     
    var body: some View {
        VStack{
            Spacer()
            Image("partlycloudybg")
            Text("Weather").font(.system(size: 54)).fontWeight(.bold)
            Text("Forecast").font(.title).foregroundColor(.color1)
            Spacer()
            Spacer()
            Spacer()
        }.frame(width: 100.w)
            .background(LinearGradient(colors: [.splashBGColor1,.splashBGColor2], startPoint: .top, endPoint: .bottom))

    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
