//
//  main.swift
//
//
//  Created by Piotrek Jeremicz on 03.09.2024.
//

import Core

struct Struct {
    let title: String
    let badge: Int
    let isEnabled: Bool
    let content: [Int]
}

class Class {
    let title: String
    let badge: Int
    let isEnabled: Bool
    let content: [Int]
    
    init(title: String, badge: Int, isEnabled: Bool, content: [Int]) {
        self.title = title
        self.badge = badge
        self.isEnabled = isEnabled
        self.content = content
    }
}

let theStruct = Struct(
    title: "Hello Swift!",
    badge: 1,
    isEnabled: true,
    content: Array(0...10)
)

let theClass = Class(
    title: "Hello Swift!",
    badge: 1,
    isEnabled: true,
    content: Array(0...10)
)

print("Struct vs Class")

Measure.the("Initialization")

measure("Struct.init()") {
    let _ = Struct(
        title: "Hello Swift!",
        badge: 1,
        isEnabled: true,
        content: Array(0...10)
    )
}

measure("Class.init()") {
    let _ = Class(
        title: "Hello Swift!",
        badge: 1,
        isEnabled: true,
        content: Array(0...10)
    )
}

Measure.run()

Measure.the("Access")
measure("Struct.title") {
    let _ = theStruct.title
}

measure("Class.title") {
    let _ = theClass.title
}
Measure.run()

Measure.the("Copy")
measure("Struct copy") {
    let _ = theStruct
}

measure("Class copy") {
    var _ = Class(
        title: theClass.title,
        badge: theClass.badge,
        isEnabled: theClass.isEnabled,
        content: theClass.content
    )
}
Measure.run()
