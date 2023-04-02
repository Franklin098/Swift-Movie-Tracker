//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 1/04/23.
//

import SwiftUI
import CoreData

// it is a "struct" not a "class" so is doesn't inherit something, just meet some protocol
struct ContentView: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seeing = false
    
    var body: some View {
        
        List {
            
            Section{
                SectionTitle(title: "Title")
                
                TextField("Movie Title",text: $title)
            }
            
            // a section let's group things like a stack
            Section {
                
                SectionTitle(title: "Rating")
                
                HStack{
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(rating)))
                        .font(.title)
                    Spacer()
                }
                
                Slider(value: $rating, in: 1...5 , step: 1)
            }
            
            Section{
                
                SectionTitle(title: "Seen")
                
                Toggle(isOn: $seeing){
                    
                    if title == ""{
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(title)")
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
                }

            }
            
            
        }.listStyle(GroupedListStyle())
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
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
