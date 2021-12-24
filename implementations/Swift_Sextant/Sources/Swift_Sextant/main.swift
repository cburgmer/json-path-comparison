import Foundation
import Sextant

enum MyError: Error {
    case runtimeError(String)
}

let selector: String = CommandLine.arguments[1]

var input: String = ""
while let line = readLine() {
    input = input + line + "\n"
}

guard let result = input.query(values: selector) else {
    print("NOT_SUPPORTED")
    exit(2)
}

guard let resultJson = try? JSONSerialization.data(withJSONObject: result, options: [.fragmentsAllowed]) else {
    print("Can't serialize results")
    exit(1)
}

if let resultJsonString = String(data: resultJson, encoding: .utf8) {
    print(resultJsonString)
}
