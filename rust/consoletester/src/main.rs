use std::env;
use std::process;
use std::{thread, time};

fn main() {
    println!("Console Tester...");

    let args: Vec<String> = env::args().collect();
    dbg!(args);

    let b_standard_output: bool = true; // "StandardOutputOff"
    let b_standard_error: bool = true; // "StandardErrorOff"
    let delay = time::Duration::from_millis(250);
    let count: u8 = 12;

    for n in 1..=count {
        if b_standard_output {
            println!("Number (out) = {:0>2}, {:>4b}", n, n);
        }
        if b_standard_error {
            eprintln!("Number (err) = {:0>2}, {:>4b}", n, n);
        }
        thread::sleep(delay);
    }
}
