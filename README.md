# WSL Proxy Files

WSL (Windows Subsystem for Linux) is an awesome bit of innovation by Microsoft that allows you to run Linux inside of Windows 10 without the need for a Virtual Machine. This has several benefits, the largest of which is the memory that you save by not running a whole secondary OS. Unfortunately it also has it's drawbacks, the biggest of which is a distinct lack of support through editors such as Atom, VSCode, and Sublime Text.

The goal of this project is to create a collection of "proxy" batch files that can be used to route requests to the linux version of a command. Almost all of the files will have the same layout

```batch
@echo off
bash.exe -c "php %*"
```

As an example usecase take the [atom-linter](https://github.com/steelbrain/linter) package. Most of the linters, such as [linter-php]() require the path to an executable in order to run. If that executable is inside of WSL however, there is no way to access it.

Using the wsl-proxy `php.bat` file however, you can just replace the path to the executable with `C:\\Users\\myuser\\path\\to\\wsl-proxy\\php.bat`. Requests are now being routed to the linux version of PHP.

**Pro tip:** If you clone this and add the cloned directory to your windows PATH you will be able to access any of the proxied commands through command prompt (even without the `.bat` extension)

**Note:** This is an experiment currently and I can't guarentee it will work with everything, but please feel free to add files here. Let's turn this into a one-stop shop for wsl-proxy files.

## Auto-generating proxy files

Run the `proxygen.cmd` script to automatically generate proxies. A subfolder named `.\autogen` will be created, and all the autogenned proxy files will be placed here -- add this folder to your Windows PATH if you want access to the proxied commands without typing in a full path.

Usage:
* (No args): `proxygen`  
Prompts you to enter program names from stdin (press CTRL-D when done).
* (Redirect from file): `proxygen < program_name_file`  
Same as above, but reads program names from a file.
* (Specify args on command line): `proxygen program1 program2 ...`

Examples:  
`proxygen gcc g++`  
`proxygen /usr/bin/foo`  
`proxygen /usr/bin/*`  
`proxygen /usr/bin/* /bin/*`

Program names will be resolved to absolute paths. If a program is not found, a warning message will be displayed (the proxy will still be created).
