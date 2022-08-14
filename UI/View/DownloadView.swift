//
//  TestView.swift
//  UI
//
//  Created by Ivan Terziev on 15.08.22.
//

import SwiftUI

struct DownloadView: View {
    var body: some View {
        VStack {
            Text("Download View")
                .font(.title)
            Text("is very")
                .font(.headline)
                .foregroundColor(.indigo)
        }
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
    }
}
