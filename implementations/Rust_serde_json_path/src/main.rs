extern crate serde_json;

use std::io;
use std::env;
use std::process;
use std::panic;
use serde_json_path::JsonPath;

fn main() {
    panic::set_hook(Box::new(|_| {
        println!("panic occurred");
    }));

    let query = env::args().nth(1).unwrap();

    let json = serde_json::from_reader(io::stdin()).unwrap();

    let path = JsonPath::parse(&query)
        .unwrap_or_else(|err| {
            println!("{}", err);
            process::exit(2);
        });

    let nodes = path
        .query(&json)
        .all();

    serde_json::to_writer(io::stdout(), &nodes).unwrap();
}
