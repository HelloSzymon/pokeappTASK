//
//  SplashScreen.swift
//  pokeappTASK
//
//  Created by Szymon Wnuk on 15/07/2022.
//
// Creating splash screen with aniamtions
import SwiftUI
struct SplashScreen: View {
    @State private var isOn = false
    @State private var opacity = 0.1
    @State private var size = 2.0
    
    var body: some View {
        if isOn {
            ContentView()
        } else {
            ZStack {
                Image("landscape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                
                    VStack {
                        Image("pokemonLogo")
                            .resizable()
                            .frame(width: 333.0, height: 200.0, alignment: .top)
                            .opacity(opacity)
                            .animation(.linear(duration: 1.5), value: 2)
                            .scaleEffect(size)
                            .onAppear{
                                withAnimation {
                                    self.size = 0.9
                                    self.opacity = 1.5
                                }
                            }
                        Spacer()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isOn = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

