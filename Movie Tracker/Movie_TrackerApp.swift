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

    var body: some Scene {
        WindowGroup {
            MovieDetail(movie: Movie())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
