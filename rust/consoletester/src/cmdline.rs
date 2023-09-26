use std::env;

pub(crate) fn do_stuff_with_args() {
    let args: Vec<String> = env::args().collect();
    // dbg!(args.clone());
    println!("{}", args.len());
    let v1_iter = args.iter();

    for val in v1_iter {
        if val.to_lowercase().contains("delay") {
            println!("Got: {} the one we wanted!", val);
            println!("     [{}]", val.split(":").last().unwrap())
        } else {
            println!("Got: {}", val);
        }
    }
    let mut iter = args.iter();
    let stdout_off = iter.find(|&r| r == "-StandardOutputOff");
    if stdout_off == None {
        println!("Not found")
    } else {
        println!("Found")
    }
    for arg in args.clone() {
        println!("Arg: {}", arg)
    }
}

pub(crate) fn find_cmd_line_switch(arg: String) -> String {
    let args: Vec<String> = env::args().collect();
    let v1_iter = args.iter();

    let mut result: String = "".to_string();
    for val in v1_iter {
        if val.to_lowercase().contains(arg.as_str()) {
            result = val.split(":").last().unwrap().parse().unwrap();
        }
    }
    result
}

pub(crate) fn get_integer_value(arg: String, default: u32) -> u32 {
    let result_s: String = find_cmd_line_switch(arg);
    let mut result: u32 = default;
    if !result_s.is_empty() {
        result = result_s.parse().unwrap();
    }
    result
}
