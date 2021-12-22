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

guard let inputData = input.data(using: String.Encoding.utf8 ) else {
    print("Can't decode stdin")
    exit(1)
}

let inputJson: JsonAny = try? JSONSerialization.jsonObject(with: inputData, options: .allowFragments)
if inputJson == nil {
    print("Can't deserialize input")
    exit(1)
}

guard let result = inputJson.query(values: selector) else {
    print("Can't execute query")
    exit(1)
}

guard let resultJson = try? JSONSerialization.data(withJSONObject: result, options: [.fragmentsAllowed]) else {
    print("Can't serialize results")
    exit(1)
}

print(resultJson)
