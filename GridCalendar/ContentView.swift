//
//  ContentView.swift
//  GridCalendar
//
//  Created by Miguel Rodriguez on 1/12/26.
//
//  Come back later and add add more functionality
//  From the article:
//  As a challenge exercise, you might try to add functionality to the calendar to make it more realistic, such as labels for the days of the week (Sunday – Monday) and making the dates line up accurately with the labels given a specific year.

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                ForEach(year, id: \.name) { month in
                    Section(header: Text(verbatim: month.name).font(.headline)) {
//                        ForEach(weekDays.daysOfTheWeek) { weekDay in
//                            Text("\(weekDay)")
//                        }
                        ForEach(month.days) { day in
                            Capsule()
                                .overlay(Text("\(day.value)").foregroundStyle(.white))
                                .foregroundStyle(.blue)
                                .frame(height: 40)
                        }
                    }
                }
            }
        }
    }
}

struct Day: Identifiable {
    let id = UUID()
    let value: Int
}

struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    
    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
    }
}

let year = [
    Month(name: "January", numberOfDays: 31),
    Month(name: "February", numberOfDays: 28),
    Month(name: "March", numberOfDays: 31),
    Month(name: "April", numberOfDays: 30),
    Month(name: "May", numberOfDays: 31),
    Month(name: "June", numberOfDays: 30),
    Month(name: "July", numberOfDays: 31),
    Month(name: "August", numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October", numberOfDays: 31),
    Month(name: "November", numberOfDays: 30),
    Month(name: "December", numberOfDays: 31),
]

// days of the week
struct DaysOfTheWeek: Identifiable {
    let id = UUID()
    let daysOfTheWeek = ["S", "M", "T", "W", "T", "F", "S"]
}

let weekDays = DaysOfTheWeek()

#Preview {
    ContentView()
}
