//
//  main.swift
//  Swifty Measurement
//
//  Created by Piotrek Jeremicz on 31.08.2024.
//

import Core

Measure.the("Higher Order Functions - Map")

struct Person {
    let name: String
    let age: Int
    let isDeveloper: Bool
}

let people = [
    Person(name: "Peter", age: 32, isDeveloper: true),
    Person(name: "Kate", age: 25, isDeveloper: false),
    Person(name: "Joe", age: 45, isDeveloper: false),
    Person(name: "Tom", age: 41, isDeveloper: true)
]

measure("Control Flow method") {
    var names = [String]()
    
    for person in people {
        names.append(person.name)
    }
}

measure("Closure parameter") {
    let _ = people.map { person in person.name }
}

measure("Shorthand argument") {
    let _ = people.map { $0.name }
}

measure("Key Path") {
    let _ = people.map(\.name)
}

Measure.run()
