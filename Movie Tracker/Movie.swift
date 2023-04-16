//
//  Movie.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 8/04/23.
//

import Foundation

// if we want to render a List in SwiftUI, the data object must be an Identifiable
struct Movie: Identifiable {
    
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seeing = false
    
}


// Observed Object

class MovieStorage: ObservableObject {
    
    // @Published -> every time there are changes to this variable, go and tell Swift UI to update
    @Published var movies = [Movie]()
    
    
}
