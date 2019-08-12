//
//  ContentView.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @EnvironmentObject var data: AllData
 
    var body: some View {
        TabView(selection: $selection){
            AllLog()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("All")
                    }
                }
                .tag(0)
            MoodLog()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.slash.fill")
                        Text("Mood Only")
                    }
                }
                .tag(1)
            HealthLog()
            .tabItem {
                VStack {
                    Image(systemName: "heart.circle.fill")
                    Text("Health Only")
                }
            }
            .tag(2)
            Settings()
            .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            .tag(1)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    @EnvironmentObject var data: AllData
    
    static var previews: some View {
        ContentView()
    }
}
#endif
