# Installation

This track relies on [Wren Console][wren-console] throughout to provide a runtime for Wren. This means that we assume all execution of Wren on your
computer will happen using [Wren Console][wren-console].  Please don't get this confused with the official Wren <abbr title="Command Line Interface">CLI</abbr>.  In a perfect world you could use that runtime but it currently [has](https://github.com/wren-lang/wren-cli/pull/74) [several](https://github.com/wren-lang/wren/pull/1006) [different](https://github.com/wren-lang/wren-cli/issues/108) [issues](https://github.com/wren-lang/wren-cli/pull/105) making it a less than optimal choice for learning Wren with Exercism.

Wren Console is forked from Wren CLI, resolves these issues, and adds features to make your learning experience smoother.  Don't worry, the Wren language knowledge and concepts you'll be learning should apply wherever you wish to use Wren in the future.

## Install Overview

- [ ] Install Git for the `git` command
- [ ] Install [Wren Console][wren-console] for the `wrenc` command
- [ ] Install [Wren Package][wren-package] for simple Wren packages

### Install Git

You'll need the `git` binary installed and in your path.  This is how Wren Package installs packages (such as the test suite you'll need for testing your exercises, etc).  You can confirm this with `git --version`:

```
$ git --version
git version 2.31.1
```

Don't worry if the exact version number isn't a match, this isn't usually super critical.

**Windows**

The official Git download is a good place to start:

- https://git-scm.com/download/win

**Linux**

Your favorite package manager should help you out.

**Mac**

All recently versions of Mac OS bundle `git` right out of the box.


### Install Wren Console

#### Windows

You'll want to [download the latest release][releases] from GitHub:

After that you'll need to extract the `wrenc` executable and copy it into your path.

It's also possible to [build from source][build-from-source] if you have Visual Studio.

#### Linux

You'll want to [download the latest release][releases] from GitHub.

```sh
wget -c https://github.com/joshgoebel/wren-console/releases/download/v0.2.90/wren-console-v0.2.90-linux.tar.gz
tar xzf wren-console-v0.2.90-linux.tar.gz
```

And make sure it's available somewhere in your `PATH`.

```sh
cp bin/wrenc /usr/local/bin/
```

If you're comfortable with such things it's pretty easy to [build from source][build-from-source].

#### Mac

The easiest installation is using [Homebrew][homebrew]:

```
brew tap exercism/wren
brew install wren-console
```

Alternatively you can [download the latest release][releases] from Github and
install it manually as shown in the Linux instructions.  Building from source is also pretty simple if you're already familiar with such things.

### Install Wren Package

Lastly, we'll need to install `wren-package` where Wren Console can find it easily.  Any directory higher than where your exercises are stored will be just fine.  Your home directory or `Exercism` directory is perfect.

#### Windows

```sh
cd C:\Users\yourusername\
mkdir wren_modules
git clone https://github.com/joshgoebel/wren-package
```

#### Linux / Mac

```sh
cd ~
mkdir wren_modules
git clone https://github.com/joshgoebel/wren-package
```


### Testing the Installation

After your believe you've got the binary installed propery, it's good to test if everything is working.

1. Open up a _terminal_ (`Terminal`, `cmd`, `Powershell`, `bash`, ...)
2. Run `wrenc -v`

You should see both the `wrenc` and Wren versions listed:

```
wrenc v0.2.90 (wren v0.4.0)
```

**Note**: It is important you open a _new_ terminal window. Any open terminal
windows might not have been refreshed after the installation completed. This
means that the open terminals don't know that a new program was installed.

> _**Help**_: `'wrenc' is not recognised`
>
> You likely haven't placed `wrenc` in your PATH... On MacOS and Linux you can alter yur path by adding the following to either
> `~/.bash_profile` or `~/.zshrc`:
>
> ```bash
> export PATH=/path/to/your/wrenc/:$PATH
> ```
> **No idea if any of this is correct.**
> On Windows open the start menu and search for "environment variables". You'll
> need to edit the `PATH` entry and _add_ the path to the `wrenc` binaries here.
> Usually these are found at `C:\Program Files\nodejs`. If you browse here with
> your `File Explorer`, you should find `node.exe`, `npm.bat` and `npx.bat`.
>
> Close any open terminals and open a new one.

---

## Assignment Requirements

Please follow [these instructions][cli-walkthrough] to download `exercism` CLI for your OS.

Once CLI is all setup & configured, download the first exercise - `hello-world`:

```bash
$ exercism download --exercise=hello-world --track=wren
```

Each assignment then needs some tools to run the tests. They can be installed
running this command within each assignment directory:

```bash
$ wrenc package.wren install
```

[homebrew]: https://brew.sh
[releases]: https://github.com/joshgoebel/wren-console/releases
[wren-console]: https://github.com/joshgoebel/wren-console
[wren-package]: https://github.com/joshgoebel/wren-package
[wren-cli]: https://github.com/wren-lang/wren-cli
[build-from-source]: https://github.com/joshgoebel/wren-console#to-build-wren-console
[cli-walkthrough]: https://exercism.io/cli-walkthrough