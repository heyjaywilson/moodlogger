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
    
    // @FetchRequest(fetchRequest: MoodEntity.allMoodsFetchRequest()) var moods: FetchedResults<MoodEntity>
    
    var body: some View {
        VStack {
            Button(action: {
                print("add mood")
                let mood = MoodEntity(context: self.managedObjectContext)
                mood.date_logged = Date()
                mood.id = UUID()
                mood.mood = "😘"
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                print(mood)
            }){
                Text("Add Mood")
            }
        }
    }
}

struct AllLogs_Previews: PreviewProvider {
    static var previews: some View {
        AllLogs()
    }
}
