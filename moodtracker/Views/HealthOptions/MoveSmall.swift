//
//  MoveSmall.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/8/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct MoveSmall: View {
    var body: some View {
        HStack {
            Text("M")
            Rectangle()
                .foregroundColor(Color(hue: 0.93333, saturation: 0.95, brightness: 1.0))
        }
    }
}

#if DEBUG
struct MoveSmall_Previews: PreviewProvider {
    static var previews: some View {
        MoveSmall()
    }
}
#endif
