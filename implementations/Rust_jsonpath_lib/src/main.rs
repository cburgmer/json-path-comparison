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

    let json = match serde_json::from_reader(io::stdin()) {
        Ok(r) => r,
        Err(e) => {
            println!("{}", e);
            process::exit(1);
        }
    };
    let mut selector = jsonpath::selector(&json);

    let result = match selector(&query[..]) {
        Ok(r) => r,
        Err(e) => {
            println!("{}", e);
            process::exit(1);
        }
    };
    serde_json::to_writer(io::stdout(), &result).unwrap();
}
