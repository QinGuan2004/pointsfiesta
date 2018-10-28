//
//  File.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 14/7/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import Foundation

class userInfo {
    var name: String
    var level: Int
    var classNumber: Int
    var house: String

    init(name: String, level: Int, classNumber: Int, house: String) {
        self.name = name
        self.level = level
        self.classNumber = classNumber
        self.house = house
    }
}
