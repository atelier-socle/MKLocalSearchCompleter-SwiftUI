//
//  LocalSearchController.swift
//  SheetSlideCard
//
//  Created by Tom Baranes on 04/02/2020.
//  Copyright © 2020 Wlad Dicario. All rights reserved.
//

import Foundation
import MapKit

final class LocalSearchController: NSObject, MKLocalSearchCompleterDelegate {

    private var searchCompleter = MKLocalSearchCompleter()
    var completion: (([MKLocalSearchCompletion]) -> Void)?

    override init() {
        super.init()
        searchCompleter.delegate = self
    }

    func search(text: String, completion: @escaping ([MKLocalSearchCompletion]) -> Void) {
        self.completion = completion
        searchCompleter.queryFragment = text
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completion?(completer.results)
    }

}
