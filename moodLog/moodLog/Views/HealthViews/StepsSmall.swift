//
//  StepsSmall.swift
//  moodLog
//
//  Created by Maegan Wilson on 8/21/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct StepsSmall: View {
    var steps: Double
    var body: some View {
        Text("Steps: \(HelperFunctions().returnValue(steps, places: 0))")
            .font(.subheadline)
            .lineLimit(nil)
    }
}

struct StepsSmall_Previews: PreviewProvider {
    static var previews: some View {
        StepsSmall(steps: 0)
    }
}
