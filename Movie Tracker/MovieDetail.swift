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
                    Spacer()
                }
                
                Slider(value: $movie.rating, in: 1...5 , step: 1)
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
        MovieDetail(movie: Movie()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
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
