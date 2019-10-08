//
//  MoodDetails.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MoodDetails: View {
    var body: some View {
        ScrollView{
            Text("MOODS: :) :D")
            ActivityChart()
        }
            .navigationBarTitle(Text("Month Day, Year"), displayMode: .inline)
    }
}

struct MoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        MoodDetails()
    }
}
