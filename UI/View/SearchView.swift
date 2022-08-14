//
//  SearchView.swift
//  UI
//
//  Created by Ivan Terziev on 15.08.22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search View")
                .font(.title)
            Text("Tab bar")
                .font(.headline)
                .foregroundColor(.cyan)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
