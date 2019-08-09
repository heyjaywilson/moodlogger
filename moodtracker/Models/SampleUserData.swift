//
//  SampleUserData.swift
//  moodtracker
//
//  Created by Maegan Wilson on 8/9/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Combine

class SampleUserData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var sampleData: [Mood] = sampleMoodData
}
