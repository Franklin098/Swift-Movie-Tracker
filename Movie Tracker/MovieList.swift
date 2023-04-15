//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 8/04/23.
//

import SwiftUI

struct MovieList: View {
    
    var movies: [Movie] = [Movie() ,Movie() ,Movie()]
    
    var body: some View {
        
        // if we want to render a List in SwiftUI, the data object must be an Identifiable
        List(movies){ movie in
            
            Text(movie.title)
            
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
