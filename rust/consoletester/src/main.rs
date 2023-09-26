mod cmdline;

use std::process;
use std::{thread, time};

fn main() {
    println!("Console Tester...");

    let b_standard_output: bool = true; // "StandardOutputOff"
    let b_standard_error: bool = true; // "StandardErrorOff"

    let delay: u64 = cmdline::get_integer_value("delay".to_string(), 250) as u64;
    let delay_ms = time::Duration::from_millis(delay);
    println!("Switch delay = [{}]", delay);

    let count = cmdline::get_integer_value("count".to_string(), 5);
    println!("Switch count = [{}]", count);

    for n in 1..=count {
        if b_standard_output {
            println!("Number (out) = {:0>2}, {:>4b}", n, n);
        }
        if b_standard_error {
            eprintln!("Number (err) = {:0>2}, {:>4b}", n, n);
        }
        thread::sleep(delay_ms);
    }

    let pid: u32 = std::process::id();
    println!("pid={}", pid);

    process::exit(0); // note this will not clean up and call destructors
}
