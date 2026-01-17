//
//  ContentView.swift
//  GridCalendar
//
//  Created by Miguel Rodriguez on 1/12/26.
//
//  Come back later and add add more functionality
//  From the article:
//  As a challenge exercise, you might try to add functionality to the calendar to make it more realistic, such as labels for the days of the week (Sunday – Monday) and making the dates line up accurately with the labels given a specific year.
//  Labels for days of the week (Sunday - Monday) ✔️

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
                    Section(header: Text(verbatim: month.name).font(.headline).padding(8).background(.white).cornerRadius(15).shadow(radius: 5).opacity(0.75)) {
                        ForEach(month.weekdays) { weekday in
                            Text("\(weekday.dayOfTheWeek)").font(.headline)
                        }
                        ForEach(month.days) { day in
                            Capsule()
                                .overlay(Text("\(day.value)").foregroundStyle(.white))
                                .foregroundStyle(.blue)
                                .frame(height: 40)
                        }
                    }
                    .padding(4)
                }
            }
        }
    }
}

struct Day: Identifiable {
    let id = UUID()
    let value: Int
}

// days of the week
struct Weekday: Identifiable {
    let id = UUID()
    let dayOfTheWeek: String
}

struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    var weekdays: [Weekday] // for week days
    
    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
        
        // Su, Mo, Tu, We, Thu, Fr, Sa
        self.weekdays = [
            Weekday(dayOfTheWeek: "Su"),
            Weekday(dayOfTheWeek: "Mo"),
            Weekday(dayOfTheWeek: "Tu"),
            Weekday(dayOfTheWeek: "We"),
            Weekday(dayOfTheWeek: "Th"),
            Weekday(dayOfTheWeek: "Fr"),
            Weekday(dayOfTheWeek: "Sa")
        ]
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

#Preview {
    ContentView()
}
