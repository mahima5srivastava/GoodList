//
//  Task.swift
//  GoodList
//
//  Created by MAHIMA on 19/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    var title: String
    var priority: Priority
}
