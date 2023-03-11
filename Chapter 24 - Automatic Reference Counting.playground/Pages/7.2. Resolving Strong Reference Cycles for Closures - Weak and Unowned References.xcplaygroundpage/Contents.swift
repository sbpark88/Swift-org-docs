import Foundation

class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
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

var headingWithText: HTMLElement? = HTMLElement(name: "p", text: "Hello~")
let anotherHtml = headingWithText!.asHTML()
print(anotherHtml)  // <p>Hello~</p>


headingWithText = nil           // p is being deinitialized
print(headingWithText as Any)   // nil
