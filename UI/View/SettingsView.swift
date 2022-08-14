//
//  TestView2.swift
//  UI
//
//  Created by Ivan Terziev on 15.08.22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings View")
                .font(.title)
            Text("cool")
                .font(.headline)
                .foregroundColor(.purple)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
