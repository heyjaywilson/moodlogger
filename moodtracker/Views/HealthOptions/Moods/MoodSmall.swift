//
//  MoodSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct MoodSmall: View {
    var moods: [Mood]
    
    var body: some View {
        Text("\(combineMoods())")
            .lineLimit(nil)
            .font(.subheadline)
    }
    
    func combineMoods() -> String {
        var returnString: String = ""
        for mood in self.moods {
            returnString = returnString + mood.mood
        }
        return returnString
    }
}

#if DEBUG
struct MoodSmall_Previews: PreviewProvider {
    static var previews: some View {
        MoodSmall(moods: [Mood(mood: "😃", date_logged: Date()),Mood(mood: "🙁", date_logged: Date()),Mood(mood: "😎", date_logged: Date())])
    }
}
#endif
