extern crate jsonpath_reference_implementation;
extern crate serde_json;

use std::io;
use std::env;
use std::process;
use jsonpath_reference_implementation::jsonpath;

fn main() {
    let query = env::args().nth(1).unwrap();

    let json: serde_json::Value = serde_json::from_reader(io::stdin()).unwrap();

    let path = jsonpath::parse(&query[..])
        .unwrap_or_else(|err| {
            println!("{}", err);
            process::exit(2);
        });

    let result = path.find(&json)
        .unwrap_or_else(|_| {
            println!("find failed");
            process::exit(1);
        });

    serde_json::to_writer(io::stdout(), &result).unwrap();
}
