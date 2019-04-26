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
