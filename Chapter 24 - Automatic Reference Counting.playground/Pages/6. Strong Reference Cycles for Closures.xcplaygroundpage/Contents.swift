import Foundation

class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit { print("\(name) is being deinitialized") }
}

var heading: HTMLElement? = HTMLElement(name: "h1")
let html = heading!.asHTML()
print(html)         // <h1 />

var headingWithText: HTMLElement? = HTMLElement(name: "p", text: "Hello~")
let anotherHtml = headingWithText!.asHTML()
print(anotherHtml)  // <p>Hello~</p>


heading = nil
headingWithText = nil
print(heading as Any)           // nil
print(headingWithText as Any)   // nil
