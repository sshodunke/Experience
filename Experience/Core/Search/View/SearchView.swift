//
//  SearchView.swift
//  Experience
//
//  Created by Smith Shodunke on 21/08/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchFieldText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                
            }
            .navigationTitle("Search")
            .searchable(
                text: $searchFieldText,
                prompt: "Search Video Games"
            )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
