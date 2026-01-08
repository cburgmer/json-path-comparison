open System
open System.Text.Json


let rec readlines () = seq {
    let line = Console.ReadLine()
    if line <> null then
        yield line
        yield! readlines ()
}

let args = System.Environment.GetCommandLineArgs()

let lines = readlines()
let payload = String.concat "" lines

let results = FSharp.Data.JsonValue.Parse payload |> FSharp.Data.JsonPath.findList args[1]
printfn "%O" results
