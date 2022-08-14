//
//  SplashScreenView.swift
//  UI
//
//  Created by Ivan Terziev on 20.08.22.
//

import SwiftUI

struct SplashScreenView: View {
    
    // MARK: - State and env variables
    // Animation variables
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    @State var showHomescreen = false
    @State var showNavButtons = false
    
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - VStack for loading view and tabbar view
            if !showHomescreen {
                VStack(spacing: 0) {
                    
                    // Used for loading animation
                    ZStack {
                        Color.teal
                            .background(.teal)
                        
                        // Home texh
                        Text("Home")
                            .font(.system(size: 35).bold())
                            .foregroundColor(.white)
                            .scaleEffect(endAnimation ? 0.75 : 1)
                            .offset(y: textAnimation ? -5 : 110)
                        
                        // App logo
                        if !endAnimation {
                            Image(systemName: "paperplane")
                                .resizable()
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: "Logo", in: animation)
                                .frame(width: 128, height: 128)
                        }
                        
                        // Nav bar after finnished animation
                        HStack {
                            
                            // Left button
                            if showNavButtons {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 5)
                            }
                            
                            Spacer()
                            
                            // Right button
                            if endAnimation {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .aspectRatio(contentMode: .fit)
                                    .matchedGeometryEffect(id: "Logo", in: animation)
                                    .frame(width: 35, height: 35)
                                    .padding(.trailing, 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Used to animate background to nav bar size
                    .frame(height: endAnimation ? 40 : nil)
                    .zIndex(1)
                    
                }
                // Attaches the nav bar to the top of the screen
                .frame(maxHeight: .infinity, alignment: .top)
                
                // Animation logic (starts after the view appears)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        
                        // Moves the text up
                        withAnimation(.spring()) {
                            textAnimation.toggle()
                        }
                        
                        // Transitions to nav bar
                        withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                            endAnimation.toggle()
                        }
                        
                        // Shows the second nav button
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            withAnimation {
                                showNavButtons.toggle()
                            }
                        }
                    }
                }
            }
            
            // Shows the Tab bar view after animation is finished
            if showHomescreen {
                TabBarView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
        // Toggles the tab bar view
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation{
                    showHomescreen.toggle()
                }
            }
        }
    }
}

// MARK: - Preview
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .preferredColorScheme(.dark)
    }
}
