//
//  main.swift
//  Swifty Measurement
//
//  Created by Piotrek Jeremicz on 17.09.2024.
//

import Core

Measure.the("Control Flow - For Loop")

struct Weekday: Codable {
    let name: String
    let tasks: [String]
}

let weekPlan: [Weekday] = [
    .init(name: "Monday", tasks: ["Wake up", "Eat breakfast", "Code"]),
    .init(name: "Tuesday", tasks: ["Code", "Eat lunch", "Go to gym"]),
    .init(name: "Wednesday", tasks: ["Code", "Eat dinner", "Go to gym"]),
    .init(name: "Thursday", tasks: ["Code", "Drink coffee", "Go to gym"]),
    .init(name: "Friday", tasks: ["Code", "Make sandwiches", "Make some party"]),
    .init(name: "Saturday", tasks: ["Code", "Find a restaurant", "Ride a bike"]),
    .init(name: "Sunday", tasks: ["Code", "Eat anything", "Go back to sleep"]),
]

measure("forEach") {
    weekPlan.forEach { day in
        let _ = day.tasks
    }
}

measure("for in by element") {
    for day in weekPlan {
        let _ = day.tasks
    }
}

measure("for in by index") {
    for i in 0..<weekPlan.count {
        let _ = weekPlan[i].tasks
    }
}

Measure.run()
