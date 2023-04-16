//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 8/04/23.
//

import SwiftUI

struct MovieList: View {
    
    // every time there is a change in its @Published properties, the UI updates
    //@ObservedObject var movieStorage = MovieStorage()
    
    // Environment objects are aviable in all the app !
    @EnvironmentObject var movieStorage: MovieStorage
    
    var body: some View {
        
        NavigationView{
            
            // if we want to render a List in SwiftUI, the data object must be an Identifiable
            List(movieStorage.movies){ currentMovie in
                
                NavigationLink(destination: MovieDetail(movie: currentMovie,newMovie: false) ){
                    Text(currentMovie.title)
                }
                
            }.navigationBarTitle("Movies")
                .navigationBarItems(trailing:
                    NavigationLink(destination:MovieDetail(movie: Movie(),newMovie: true)){
                        Image(systemName: "plus")
                    }
                )
            
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
            .environmentObject(MovieStorage())
    }
}
