mod cmdline;

use std::process;
use std::{thread, time};

fn main() {
    println!("Console Tester...");

    let b_standard_output: bool = !cmdline::find_switch_alt("StandardOutputOff");
    let b_standard_error: bool = !cmdline::find_switch(String::from("StandardErrorOff"));
    println!("Switch Output options, StdOut = {}, StdErr = {}", b_standard_output, b_standard_error);

    if !b_standard_output && !b_standard_error {
        println!("ERROR: both stdout and stderr turned off, so nothing to output");
        process::exit(-1);
    }

    let delay: u64 = cmdline::get_integer_value("delay", 250) as u64;
    let delay_ms = time::Duration::from_millis(delay);
    println!("Switch delay = [{}]", delay);

    let count = cmdline::get_integer_value("count", 5);
    println!("Switch count = [{}]", count);

    let mut message: String;
    message = cmdline::get_string_value("message");
    if message.is_empty() {
        message = "Number".to_string();
    }

    for n in 1..=count {
        if b_standard_output {
            println!("{} (out) = {:0>2}, {:>4b}", message, n, n);
        }
        if b_standard_error {
            eprintln!("{} (err) = {:0>2}, {:>4b}", message, n, n);
        }
        thread::sleep(delay_ms);
    }

    let pid: u32 = process::id();
    println!("pid={}", pid);

    process::exit(0); // note this will not clean up and call destructors
}
