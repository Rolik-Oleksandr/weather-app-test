import SwiftUI

struct ForecastView: View {
    @StateObject private var viewModel = ForecastViewModel()
    @StateObject private var locationManager = LocationManager()
    
    @State private var city: String = ""
    @State private var hasFetchedLocation: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.green.opacity(0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: Constants.Images.geoIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.bottom, 20)
                        Text("\(viewModel.cityName)")
                            .font(.title)
                            .bold()
                            .padding(.bottom)
                    }
                    
                    SearchBarView(text: $city, onSearch: {
                        viewModel.fetchWeather(for: city)
                    })
                    
                    if let today = viewModel.todayForecast {
                        DailyForecastView(forecast: today)
                    }
                    
                    ForEach(viewModel.forecast) { forecast in
                        ForecastRowView(forecast: forecast)
                    }
                    
                    Spacer()
                }
                .padding(.top, 70)
                .onReceive(locationManager.$lastLocation) { location in
                    guard let location, !hasFetchedLocation else { return }
                    hasFetchedLocation = true
                    viewModel.fetchCityName(from: location)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ForecastView()
}
