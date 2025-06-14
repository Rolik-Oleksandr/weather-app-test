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
    
    func getDayNumber(from dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString) {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            return "\(day)"
        }
        return "-"
    }
    
    func getDayOfWeek(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        if let date = formatter.date(from: date) {
            formatter.dateFormat = "EEE"
            return formatter.string(from: date).capitalized
        }
        return "unknown"
    }
}

struct WeatherDescription: Codable {
    let description: String
    let icon: String
}
