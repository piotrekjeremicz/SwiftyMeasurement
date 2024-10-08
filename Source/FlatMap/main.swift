//
//  main.swift
//
//
//  Created by Piotrek Jeremicz on 03.09.2024.
//

import Core

Measure.the("Higher Order Functions - Flat Map")

struct ColorGroups {
    let group: String
    let names: [String]
}

let colors = [
    ColorGroups(group: "Yellow", names: ["Lemon", "Mustard", "Amber"]),
    ColorGroups(group: "Red", names: ["Scarlet", "Burgundy", "Carmine"]),
    ColorGroups(group: "Green", names: ["Lime", "Pear", "Basil"]),
    ColorGroups(group: "Blue", names: ["Sky", "Navy", "Indigo"])
]

measure("Control Flow method") {
    var colorNames = [String]()
    
    for group in colors {
        colorNames += group.names
    }
}

measure("Closure parameter") {
    let _ = colors.flatMap { group in group.names }
}

measure("Shorthand argument") {
    let _ = colors.flatMap { $0.names }
}

measure("Key Path") {
    let _ = colors.flatMap(\.names)
}

Measure.run()


