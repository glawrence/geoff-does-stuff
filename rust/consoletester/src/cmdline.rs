use std::env;

// does the command line switch exist or not
pub(crate) fn find_switch(arg: String) -> bool {
    let args: Vec<String> = env::args().collect();
    let mut iter = args.iter();
    let mut argument: String = String::from("-");
    argument.push_str(&arg);

    let stdout_off = iter.find(|&r| r == &argument);
    stdout_off != None
}

// does the command line switch exist or not
pub(crate) fn find_switch_alt(arg: &str) -> bool {
    find_switch(String::from(arg))
}

// get the string value of the switch
pub(crate) fn get_string_value(arg: &str) -> String {
    let args: Vec<String> = env::args().collect();
    let v1_iter = args.iter();

    let mut result: String = "".to_string();
    for val in v1_iter {
        if val.to_lowercase().contains(String::from(arg).to_lowercase().as_str()) {
            result = val.split(":").last().unwrap().parse().unwrap();
        }
    }
    result
}

// get the integer value of the switch
pub(crate) fn get_integer_value(arg: &str, default: u32) -> u32 {
    let result_s: String = get_string_value(arg);
    let mut result: u32 = default;
    if !result_s.is_empty() {
        result = result_s.parse().unwrap_or(default);
    }
    result
}
