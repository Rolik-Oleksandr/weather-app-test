import Foundation

struct WeatherResponce: Codable {
    let cityName: String
    let data: [DailyForecast]
}

struct DailyForecast: Codable, Identifiable {
    let id = UUID()
    let date: String
    let highTemp: Double
    let lowTemp: Double
    let weather: WeatherDescription
}

struct WeatherDescription: Codable {
    let description: String
    let icon: String
}
