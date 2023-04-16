//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 1/04/23.
//

import SwiftUI
import CoreData

// it is a "struct" not a "class" so is doesn't inherit something, just meet some protocol
struct MovieDetail: View {
    
    @State var movie: Movie
    
    @Environment(\.presentationMode) var presentationMode
    
    let newMovie : Bool
    
    
    @EnvironmentObject var movieStorage : MovieStorage
    // environment is a global place to store data
    // if you have some data that is not being used in other places, @ObservableObject is fine
    
    /*
     Accesibility: make the app useful and accesible to as many customer as possible
     
     Normaly it is related to provide functionality for people with some kind of medical problem in hearing, seeing, etc.
     
     App must be:
     
     - Understandable
     - Iteractable (someone can use the app even just talking or withound seeing)
     - Navigable (our navigation is simple, consistent)
     */
    
    
    var body: some View {
        
        List {
            
            Section{
                SectionTitle(title: "Title")
                
                // dolar sign $ means that the View and the data are binding
                // when one updates, the other gets notified
                TextField("Movie Title",text: $movie.title)
            }
            
            // a section let's group things like a stack
            Section {
                
                SectionTitle(title: "Rating")
                
                HStack{
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(movie.rating)))
                        .font(.title)
                        .accessibilityLabel(Text("\(Int(movie.rating)) star rating"))
                    Spacer()
                }
                
                Slider(value: $movie.rating, in: 1...5 , step: 1)
                    .accessibilityLabel(Text("\(Int(movie.rating))"))
            }
            
            Section{
                
                SectionTitle(title: "Seen")
                
                Toggle(isOn: $movie.seeing){
                    
                    if movie.title == ""{
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(movie.title)")
                    }
                }
            }
            
            Section{
                Button {
                    
                    if newMovie {
                        
                        movieStorage.movies.append(movie)
                        
                    } else {
                        
                        for i in 0..<movieStorage.movies.count {
                            if movieStorage.movies[i].id == movie.id {
                                movieStorage.movies[i] = self.movie
                            }
                        }
                    
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)

            }
            
            
        }.listStyle(GroupedListStyle())
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(),newMovie: true).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct SectionTitle: View {
    
    var title = ""
    
    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.gray)
    }
}
