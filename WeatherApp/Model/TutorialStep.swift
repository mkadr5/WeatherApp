//
//  TutorialStep.swift
//  WeatherApp
//
//  Created by Muhammet Kadir on 10.04.2023.
//

import SwiftUI


struct TutorialStep {
    var image: String
    var title: String
    var description: String
}


let tutorialSteps = [
    TutorialStep(
        image: "night",
        title: "Detailed Hourly Forecast",
        description: "Get in - depth weather information."
    ),
    TutorialStep(
        image: "sun",
        title: "Real-Time Weather Map",
        description: "Watch the progress of the precipitation to stay informed"
    ),
    TutorialStep(
        image: "rain",
        title: "Weather Around the World",
        description: "Add any location you want and swipe easily to chnage."
    ),
    TutorialStep(
        image: "partlycloudy",
        title: "Detailed Hourly Forecast",
        description: "Get in - depth weather information."
    )
]
