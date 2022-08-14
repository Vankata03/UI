//
//  TabBarView.swift
//  Appartments
//
//  Created by Ivan Terziev on 15.08.22.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - State variables
    @State var selectedTab: Tab = .home
    @State var color: Color = .teal
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Tab bar cases
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .download:
                    DownloadView()
                case .settings:
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Tab bar creation
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        
                        // Change toggled button
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                            selectedTab = item.tab
                            color = item.color
                        }
                    } label: {
                        // Image and text
                        VStack(spacing: 0) {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        // Devide the phone frame button count + 1, used to create the edge of the bar and not be edge to edge
                        .frame(maxWidth: UIScreen.main.bounds.size.width/5)
                    }
                    .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
                    .blendMode(selectedTab == item.tab ? .overlay : .normal)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 19)
            .frame(height: 85, alignment: .top)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 34, style: .continuous))
            
            // Create and move the color circle behind the tab bar
            .background(
                HStack {
                    if selectedTab == .settings { Spacer() }
                    if selectedTab == .search { Spacer() }
                    if selectedTab == .download {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(color).frame(width: 70)
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .search {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .download { Spacer() }
                }
                    .padding(.horizontal, 8)
            )
            
            // Create and move the line over the buttons
            // TODO: - fix lenght by using geometry reader
            .overlay(
                HStack {
                    
                    // Moving logic
                    if selectedTab == .settings { Spacer() }
                    if selectedTab == .search { Spacer() }
                    if selectedTab == .download {
                        Spacer()
                        Spacer()
                    }
                    
                    // Line
                    Rectangle()
                        .fill(color)
                        .frame(width: 30, height: 5)
                        .cornerRadius(3)
                        .frame(width: 90)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    // Moving logic
                    if selectedTab == .home { Spacer() }
                    if selectedTab == .search {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .download { Spacer() }
                }
                    .padding(.horizontal, 5)
                    .padding(.top, 2)
            )
            
            // Frame lower than needed so that the bar doesnt connect with bottom and floats
            .frame(maxHeight: 80)
            .ignoresSafeArea()
        }
    }
}

// MARK: - Preview
struct TabBarView_Preview: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .preferredColorScheme(.dark)
    }
}
