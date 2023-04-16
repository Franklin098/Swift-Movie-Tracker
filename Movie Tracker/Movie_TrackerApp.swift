//
//  Movie_TrackerApp.swift
//  Movie Tracker
//
//  Created by Franklin Velásquez on 1/04/23.
//

import SwiftUI

@main
struct Movie_TrackerApp: App {
    let persistenceController = PersistenceController.shared
    
    // our Movie Storage object will be accesible in all the screens of the app
    let movieStorage = MovieStorage()

    var body: some Scene {
        WindowGroup {
            
        
            MovieList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(movieStorage)
        }
    }
}
