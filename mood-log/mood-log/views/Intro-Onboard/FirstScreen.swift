//
//  FirstScreen.swift
//  mood-log
//
//  Created by Maegan Wilson on 10/13/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        VStack {
            VStack{
                Text("Welcome to Mood Logger!")
                    .font(.largeTitle)
                Text("Keep track of your mood and activity.")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }.padding(.bottom)
            Divider()
            VStack{
                Text("In order to associate your mood and actvity, Mood Logger will need access to your Health data.")
                    .font(.body)
                .multilineTextAlignment(.leading)
                Button(action: {
                    print("Allow access")
                }){
                    Text("All Health Data Access").padding(.all)
                }
            }.padding(.vertical, 20)
            VStack{
                NavigationLink(destination: LogList()) {
                    Text("Go to Logs")
                }
            }
            Spacer()
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
