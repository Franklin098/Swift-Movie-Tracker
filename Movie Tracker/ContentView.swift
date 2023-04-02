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
        // Text("Hello World 3").background(Color.blue).padding().background(Color.green)
        
        // Working with Images
        // Image(systemName: "car")
        //    .resizable()
        //    .edgesIgnoringSafeArea([.all])
        //    .aspectRatio(contentMode: .fit).foregroundColor(.orange)
        
        VStack(alignment: .center) {
            Text("Hello really big text: opqwjeioaslkamvlxvkliouw")
                .lineLimit(1).font(.largeTitle)
           //     .layoutPriority(1) // displays completely this item and reduce the others
            
            Image(systemName: "lightbulb")
            
            
            Text("Goodby")
                .lineLimit(1)
            
            
            ZStack{
                Image("code").resizable().aspectRatio(contentMode: .fit)
                
                Button(action: hello) {
                    Image(systemName: "play.fill").resizable().foregroundColor(.red)
                        .aspectRatio(contentMode: .fit).frame(width: 100,height: 100)
                }
                
            }
            
            Button {
                
            } label: {
                VStack{
                    Image(systemName: "gamecontroller")
                    Text("Tap Me")
                }
                
            }.padding(.all,20)
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
                

            

        }
        
        
        
    }
    
    func hello() {
        print("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
