//
//  ContentView.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

/// Description - Tabbed menu navigation
struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            AllLogs().environment(
            \.managedObjectContext, managedObjectContext)
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("All")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "heart.slash.fill")
                        Text("Mood Only")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
