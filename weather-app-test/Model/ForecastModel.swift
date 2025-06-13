import Foundation

struct ForecastResponce: Codable {
    let cityName: String
    let data: [DailyForecast]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data
    }
}

struct DailyForecast: Codable, Identifiable {
    let id = UUID()
    let date: String
    let highTemp: Double
    let lowTemp: Double
    let weather: WeatherDescription
    let temp: Double?
    
    enum CodingKeys: String, CodingKey {
        case date = "valid_date"
        case highTemp = "high_temp"
        case lowTemp = "low_temp"
        case weather
        case temp
    }
    
    var getTemp: String {
        guard let temp = temp else { return "N/A" }
        return "\(temp)`C"
    }
}

struct WeatherDescription: Codable {
    let description: String
    let icon: String
}
