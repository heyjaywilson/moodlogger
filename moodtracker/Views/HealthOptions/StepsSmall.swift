//
//  StepsSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct StepsSmall: View {
    var steps: Int
    var body: some View {
        HStack {
            Text("👣")
            Text("\(steps)")
        }
    }
}

#if DEBUG
struct StepsSmall_Previews: PreviewProvider {
    static var previews: some View {
        StepsSmall(steps: 10000)
    }
}
#endif
