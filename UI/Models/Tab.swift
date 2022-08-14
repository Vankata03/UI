//
//  Tab.swift
//  UI
//
//  Created by Ivan Terziev on 15.08.22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Search", icon: "magnifyingglass", tab: .search, color: .cyan),
    TabItem(text: "Download", icon: "square.and.arrow.down", tab: .download, color: .indigo),
    TabItem(text: "Settings", icon: "person.circle", tab: .settings, color: .pink)
]

enum Tab: String {
    case home
    case search
    case download
    case settings
}
