import SwiftUI

struct ForecastRowView: View {
    let forecast: DailyForecast
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(10)
            .shadow(radius: 2)
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(forecast.getDayOfWeek(date: forecast.date))
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text(forecast.getDayNumber(from: forecast.date))
                            .font(.headline)
                    }
                    Text(forecast.weather.description)
                        .font(.subheadline)
                }
                
                
                Spacer()
                
                HStack {
                    Image(systemName: Constants.Images.thermometerIcon)
                    Text("\(Int(forecast.highTemp))")
                }
                .padding(.leading, 5)
                HStack {
                    Image(systemName: Constants.Images.thermometerIcon)
                    Text("\(Int(forecast.lowTemp))")
                }
                .padding(.leading, 5)
                
                if let iconURL = URL(string: "\(Constants.forecastURLIcon)\(forecast.weather.icon).png") {
                    AsyncImage(url: iconURL) { image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
