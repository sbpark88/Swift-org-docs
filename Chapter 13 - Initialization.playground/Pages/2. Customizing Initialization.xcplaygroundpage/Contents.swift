import Foundation

// 1. Initialization Parameters
//struct Celsius {
//    var temperatureInCelsius: Double
//
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//
//let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
//// boilingPointOfWater.temperatureInCelsius is 100.0
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)
//// freezingPointOfWater.temperatureInCelsius is 0.0


print("-------------------------------------")
// 2. Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


print("-------------------------------------")
// 3. Initializer Parameters Without Argument Labels
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius(37.0)
// bodyTemperature.temperatureInCelsius is 37.0


print("-------------------------------------")
// 4. Optional Property Types
//class SurveyQuestion {
//    var text: String
//    var response: String?
//    init(text: String) {
//        self.text = text
//    }
//    func ask() {
//        print(text)
//    }
//}
//
//let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
//print(cheeseQuestion.response as Any)   // nil
//
//cheeseQuestion.ask()
//cheeseQuestion.response = "Yes, I do like cheese"
//print(cheeseQuestion.response as Any)   // Optional("Yes, I do like cheese")


print("-------------------------------------")
// 5. Assigning Constant Properties During Initialization
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"
print(beetsQuestion.response as Any)    // Optional("I also like beets. (But not with cheese.)")
