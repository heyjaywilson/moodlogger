//
//  MonthDate.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct MonthDate: View {
    var month: String
    var day: String
    var body: some View {
        VStack{
            Text("\(month)")
                .font(.title)
                .fontWeight(.bold)
            Text("\(day)")
                .fontWeight(.bold)
        }
    }
}

#if DEBUG
struct MonthDate_Previews: PreviewProvider {
    static var previews: some View {
        MonthDate(month: "Aug", day: "01")
    }
}
#endif
