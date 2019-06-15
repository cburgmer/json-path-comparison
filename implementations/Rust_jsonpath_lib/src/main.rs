extern crate jsonpath_lib as jsonpath;
extern crate serde_json;

use std::io;
use std::env;

fn main() {
    let query = env::args().nth(1).unwrap();

    let json = serde_json::from_reader(io::stdin()).unwrap();
    let mut selector = jsonpath::selector(&json);

    let result = selector(&query[..]).unwrap();
    serde_json::to_writer(io::stdout(), &result).unwrap();
}
