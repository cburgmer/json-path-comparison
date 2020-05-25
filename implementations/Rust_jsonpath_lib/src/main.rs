extern crate jsonpath_lib as jsonpath;
extern crate serde_json;

use std::io;
use std::env;
use std::process;
use std::panic;

fn main() {
    panic::set_hook(Box::new(|_| {
        println!("panic occurred");
    }));

    let query = env::args().nth(1).unwrap();

    let json = serde_json::from_reader(io::stdin()).unwrap();


    let mut selector = jsonpath::Selector::new();

    let path = selector
        .str_path(&query[..])
        .unwrap_or_else(|err| {
            println!("{}", err);
            process::exit(2);
        });

    let result = path
        .value(&json)
        .select()
        .unwrap_or_else(|err| {
        println!("{}", err);
        process::exit(1);
    });

    serde_json::to_writer(io::stdout(), &result).unwrap();
}
