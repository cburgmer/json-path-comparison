import Foundation
import SwiftPath

enum MyError: Error {
    case runtimeError(String)
}

let selector: String = CommandLine.arguments[1]

var input: String = ""
while let line = readLine() {
    input = input + line
}

guard let path: SwiftPath = SwiftPath(selector) else {
    print("Can't parse selector")
    exit(1)
}

guard let inputData = input.data(using: String.Encoding.utf8 ) else {
    print("Can't decode stdin")
    exit(1)
}
let inputJson = try JSONSerialization.jsonObject(with: inputData, options: .allowFragments)

do {
    guard let result: JsonValue = try path.evaluate(with: inputJson) else {
        print("Can't execute query")
        exit(1)
    }

    // Poorman's JSON serializer. Seriously WTF Apple
    if result is String {
        print("\"" + (result as! String) + "\"")
    } else {
        if result is NSNumber {
            print(result)
        } else {
            if result is NSNull {
                print("null")
            } else {
                let jsonData = try JSONSerialization.data(withJSONObject: result, options: JSONSerialization.WritingOptions()) as NSData
                guard let jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue) else {
                    print("Canot serialize JSON")
                    exit(1)
                }
                print(jsonString)
            }
        }
    }
} catch {
    print("\(error)")
    exit(1)
}
