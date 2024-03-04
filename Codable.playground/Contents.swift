import UIKit


let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}
""".data(using: .utf8)!

struct Weather: Codable {
    var city: String
    var temperature: Double
    var condition: String
    var forecast: [Forecast]
}

struct Forecast: Codable{
    var day: String
    var high: Double
    var low: Double
    var condition: String
}

do {
    let weather1 = try JSONDecoder().decode(Weather.self, from: jsonData)
    print("The city is \(weather1.city),temp:\(weather1.temperature),condition: \(weather1.condition)")
    
    for weathers in weather1.forecast {
        print("""
----------------------------------------------
The expected weather for this day: \(weathers.day)
The expected high and low temp: \(weathers.high) , \(weathers.low)
The expected condition of the day: \(weathers.condition)
----------------------------------------------
""")
    }
} catch {
    print("Decoding error: \(error)")
}
