//
//  MoodSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct MoodSmall: View {
    var moods: [String]
    
    var body: some View {
        HStack {
            ForEach(0..<moods.count) { index in
                Text("\(self.moods[index])")
            }
        }
    }
}

#if DEBUG
struct MoodSmall_Previews: PreviewProvider {
    static var previews: some View {
        MoodSmall(moods: ["😃"])
    }
}
#endif
