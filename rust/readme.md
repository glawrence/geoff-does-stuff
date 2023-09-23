# Getting Setup
The offical place to start learngin Rust is [Learn Rust - Rust Programming Language](https://www.rust-lang.org/learn) where the "Rust by Example" section is very helpful in getting started.

This folder contains a simple example and this document contains help on how to get started with developing a Rust program.

Rust is easily extended via crates, see [crates.io: Rust Package Registry](https://crates.io/).

The two IDEs I have look at here are Visual Studio Code, available at [Download Visual Studio Tools - Install Free for Windows, Mac, Linux](https://visualstudio.microsoft.com/downloads/) and the yet to be released Rust Rover from JetBrains, available at [Install RustRover | RustRover Documentation](https://www.jetbrains.com/help/rust//installation-guide.html).

## Prerequisites
Visual Studio Code and RustRover both rely on the Microsoft C++ build tools, specifically the linker, on the Windows platform. This might already be installed if you have Visual Studio installed, in which case check you have both "MSVC v143 - VS 2022 C++ x64/x86 build tools (latest)" and "Windows 11 SDK (10.0.22000.0)" or similar versions. I know "MSVC v142" works fine with "Windows 10 SDK" and Rust.

If you do not have any Visual Studio or Microsoft Build Tools installed then install Rust as follows and `rustup` will install the necessary tools for you.

Install `rustup` via https://rustup.rs/ or [Install Rust - Rust Programming Language](https://www.rust-lang.org/tools/install).
You probably want option 1, which is for individuals, but do read the options carefully. 
This will install the C++ Build Tools (MSVC v143 - VS 2022 C++ x64/x86 build tools (latest)) from Microsoft Visual Studio as well as the Windows SDK (Windows 11 SDK (10.0.22000.0)). You can uncheck "Start after installation". After the Visual Studio installer finishes proceed with the default installation.


## Visual Studio Code
The official VSCode guide for Rust is [Rust with Visual Studio Code](https://code.visualstudio.com/docs/languages/rust) but the steps that follow summarise this.

* Install VS Code `winget install Microsoft.VisualStudioCode`
* Then install `rust-lang.rust-analyzer`, see [rust-analyzer - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer) into VSCode
* Then install `vadimcn.vscode-lldb`, see [CodeLLDB - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) into VSCode
* Open an `.rs` file, then wait while "rust-analyzer" runs and the background indexing completes
* Select "Run without debugging", it should offer to create a lanuch configuration, referencing the cargo.toml file, you can close the launch.json once generated
* Do "Run without debugging again" and you have an exe file, with output in the "Terminal" tab

## JetBrains RustRover
At the time of typing RustRover is still an "Early Access Previews", I have been using RustRover 2023.2 EAP (232.9921.62, built on September 15, 2023) and thus these steps relate to this version, and will continue until [`Install Rust` action will not install VS on Windows : RUST-11754](https://youtrack.jetbrains.com/issue/RUST-11754) is fixed.

You can install RustRover with it's own installer, but generally using the JetBrains Toolbox is easier and recommended by JetBrains.

* Install the JetBrains Toolbox with `winget install JetBrains.Toolbox`
* Use the Toolbox to install RustRover
* On launching RustRover, select "New Project"
* The "Standard library" will be blank, so click "Download via Rustup"
* Click "Create", then wait for all the background tasks to complete, specifically "Updating crates.io index"
* Run the project and everything should work fine.
