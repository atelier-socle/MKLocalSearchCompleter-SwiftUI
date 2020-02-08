//
//  SearchResultDetails.swift
//  MKLocalSearchCompleter-SwiftUI
//
//  Created by Tom Baranes on 08/02/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI

struct SearchResultDetails: View {
    let localSearch: LocalSearch

    var body: some View {
        VStack(alignment: .leading) {
            Text(localSearch.title).foregroundColor(.primary)
            Text(localSearch.subtitle).foregroundColor(.primary)
        }
    }
}
