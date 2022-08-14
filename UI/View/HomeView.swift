//
//  ContentView.swift
//  UI
//
//  Created by Ivan Terziev on 14.08.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView() {
            ScrollView {
                
                // Scroll view content
                Spacer()
                VStack() {
                    Text("Testing Home View")
                        .font(.title)
                    Button("Click Me!") {
                        print("Works!")
                    }
                    .tint(.white)
                    .font(.title)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(.teal)
                    .cornerRadius(20)
                }
                
            }
            
            // MARK: - Nav bar
            .navigationBarColor(.systemTeal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Left nav bar button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                    }
                }
                
                // Nav bar title
                ToolbarItem(placement: .principal) {
                    Button{
                        
                    } label: {
                        Text("Home")
                            .font(.title.bold())
                            .accessibilityAddTraits(.isHeader)
                            .foregroundColor(.white)
                    }
                }
                
                // Right nav bar button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title2)
                    }
                }
            }
            // Nav bar Buttons color
            .tint(.white)
        }
        .ignoresSafeArea()
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
