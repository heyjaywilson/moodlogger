//
//  MoveLarge.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/13/19.
//  Copyright © 2019 MW. All rights reserved.
//

import SwiftUI

struct MoveLarge: View {
    var body: some View {
        HStack {
            Text("M")
            Rectangle()
                .foregroundColor(Color(hue: 0.93333, saturation: 0.95, brightness: 1.0))
                .frame(minWidth: 10, maxWidth: 200, minHeight: 20, maxHeight: 20)
        }
    }
}

#if DEBUG
struct MoveLarge_Previews: PreviewProvider {
    static var previews: some View {
        MoveLarge()
    }
}
#endif
