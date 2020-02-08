//
//  ContentView.swift
//  MKLocalSearchCompleter-SwiftUI
//
//  Created by Tom Baranes on 08/02/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var searchField: String = ""
    @State private var localSearches = [LocalSearch]()
    @State private var showActivityIndicator = false

    private let localSearch = LocalSearchController()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Location", text: self.$searchField, onCommit: {
                    self.showActivityIndicator = true
                    self.localSearch.search(text: self.searchField, completion: { results in
                        self.showActivityIndicator = false
                        self.localSearches = results.map {
                            LocalSearch(title: $0.title, subtitle: $0.subtitle)
                        }
                    })
                }).accentColor(Color.primary)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.fullStreetAddress)
                    .keyboardType(.alphabet)


                if showActivityIndicator {
                    ActivityIndicator(isAnimating: $showActivityIndicator).padding(.top)
                    Spacer()
                } else {
                    List(localSearches) { search in
                        NavigationLink(destination: SearchResultDetails(localSearch: search)) {
                            SearchResultDetails(localSearch: search)
                        }
                    }
                }
            }.navigationBarTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
