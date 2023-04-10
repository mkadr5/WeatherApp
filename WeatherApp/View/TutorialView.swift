//
//  TutorialView.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 9.04.2023.
//

import SwiftUI

struct TutorialView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var currentStepIndex = 0
    @State private var secondsElapsed = 0
    
    @State private var isSkip = false
    
    init() {
        UserDefaults.standard.set(true, forKey: "tutorial")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image(tutorialSteps[currentStepIndex].image)
                    .resizable()
                    .frame(width: 350,height: 350)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top,15.h)
                PageControl(index: $currentStepIndex, maxIndex: tutorialSteps.count-1)
                Spacer()
                ZStack{
                    Circle().frame(width:140.w,height: 140.w).foregroundColor(.white)
                    VStack{
                        Spacer()
                        Text(tutorialSteps[currentStepIndex].title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.top, 20)
                            .padding(.horizontal, 150)
                        
                        Text(tutorialSteps[currentStepIndex].description)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .foregroundColor(.color1)
                            .padding(.top, 10)
                            .padding(.horizontal, 180)
                        Spacer()
                        ZStack (alignment: .center){
                            Circle()
                                .stroke(lineWidth: 1)
                                .opacity(0.3)
                                .foregroundColor(Color.gray)
                            
                            Circle()
                                .trim(from: 0.0, to: Double(secondsElapsed) / 5.0)
                                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                            
                                .fill(LinearGradient(colors: [.circleBarColor2,.circleBarColor1], startPoint: .top, endPoint: .bottom))
                                .rotationEffect(Angle(degrees: -90))
                                .animation(.linear(duration: 1.0), value: secondsElapsed)
                                .onReceive(timer) { _ in
                                    if self.currentStepIndex < tutorialSteps.count - 1 {
                                        self.secondsElapsed += 1
                                        if self.secondsElapsed >= 6 {
                                            self.currentStepIndex += 1
                                            self.secondsElapsed = 0
                                        }
                                    }
                                }
                            Button(action: {
                                if self.currentStepIndex < 3{
                                    self.currentStepIndex += 1
                                    self.secondsElapsed = 0
                                }else{
                                    self.isSkip = true
                                }
                            }, label: {
                                Image(systemName: "arrow.right").fontWeight(.bold) .padding().foregroundColor(.white)
                                    .background(LinearGradient(colors: [.linearColor1,.linearColor2], startPoint: .top, endPoint: .bottom))
                                    .clipShape(Circle())
                            }).padding()
                        }
                        .frame(width: 50, height: 50)
                        .padding(.bottom,100)
                        Spacer()
                    }
                    
                }
                
            }.navigationBarItems(trailing: Button(action:{
                self.isSkip = true
            }){
                Text("Skip").foregroundColor(.white)
            }.fullScreenCover(isPresented: $isSkip, content: {
                HomeView()
            })
            )
            .background(LinearGradient(colors: [.linearColor1,.linearColor2], startPoint: .top, endPoint: .bottom))
            
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}




struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(15)
    }
}
