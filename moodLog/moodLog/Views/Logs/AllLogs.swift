//
//  AllLogs.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/20/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct AllLogs: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: MoodEntity.allMoodsFetchRequest()) var moods: FetchedResults<MoodEntity>
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                self.showModal = true
            }){
                Text("Add Mood")
            }.sheet(isPresented: $showModal){
                MoodForm().environment(\.managedObjectContext, self.managedObjectContext)
            }
            
            List(self.moods){ entry in
                LogRow(entry: entry)
            }
        }
    }
}

struct AllLogs_Previews: PreviewProvider {
    static var previews: some View {
        AllLogs()
    }
}
