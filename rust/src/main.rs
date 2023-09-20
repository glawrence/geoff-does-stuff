use std::process;

fn main() {
    println!("Rust demo...");

    let mut x: i32 = 4;
    x = x - 20; // this will throw an error if x is defined as u32 instead of i32
    println!("x = {}", x);

    for n in 1..=15 {
        println!("Number = {:0>2}, {:>4b}", n, n);
    }

    let pid: u32 = std::process::id();
    println!("pid={}", pid);
    println!("Done");

    process::exit(0); // note this will not clean up and call destructors
}
