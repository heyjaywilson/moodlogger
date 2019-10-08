//
//  MoodDetails.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/7/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct AddMood: View {
    var body: some View {
        Button(action: { print("Add mood")}) {
            Text("+ Mood")
        }
    }
}

struct MoodDetails: View {
    var body: some View {
        ScrollView{
            HStack{
                Text("MOODS: :) :D")
            }
            ActivityChart()
            HStack{
                Text("Weight: 212lbs")
                Spacer()
                Text("- 1.23 lbs")
            }
        }
            .navigationBarTitle(Text("Month Day, Year"), displayMode: .inline)
    .navigationBarItems(trailing: AddMood())
    }
}

struct MoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MoodDetails()
        }
    }
}
