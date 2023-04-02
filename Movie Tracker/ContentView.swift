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
    
    var body: some View {
        
        // The order of the modifiers matters !
        
        // Text("Hello World 1").padding().background(Color.blue)
        // Text("Hello World 2").background(Color.blue).padding()
        Text("Hello World 3").background(Color.blue).padding().background(Color.green)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
