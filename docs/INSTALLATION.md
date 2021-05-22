# Installation

This track relies on [Wren Console][wren-console] throughout to provide a runtime for Wren. This means that we assume all execution of Wren on your
computer will happen using [Wren Console][wren-console].  Please don't get this confused with the official Wren <abbr title="Command Line Interface">CLI</abbr>.  In a perfect world you could use that runtime but it currently [has](https://github.com/wren-lang/wren-cli/pull/74) [several](https://github.com/wren-lang/wren/pull/1006) [different](https://github.com/wren-lang/wren-cli/issues/108) [issues](https://github.com/wren-lang/wren-cli/pull/105) making it a less than optimal choice for learning Wren with Exercism.

Wren Console is forked from Wren CLI, resolves known issues, and adds features to make your learning experience smoother.  Don't worry, the Wren language knowledge and concepts you'll be learning should apply wherever you wish to use Wren in the future.

#### Windows

You'll want to [download the latest release][releases] from GitHub:

After that you'll need to copy it into your path.  **Need better instructions???**


#### Linux

You'll want to [download the latest release][releases] from GitHub.

```sh
wget -c https://github.com/joshgoebel/wren-console/releases/download/v0.1.1/wren-console-v0.1.1-linux.tar.gz
tar xzf wren-console-v0.1.1-linux.tar.gz
```

And make sure it's available somewhere in your `PATH`.

```sh
cp bin/wrenc /usr/local/bin/
```

If you're comfortable with such things you could even [build from source][build-from-source].

#### Mac

The easiest installation is using [Homebrew][homebrew]:

```
brew install wren-console
```

Alternatively you can [download the latest release][releases] from Github and
install it manually as shown in the Linux instructions.  Building from source is also pretty simple if you're already familiar with such things.

### Testing the installation

After your believe you've got the binary installed propery, it's good to test if everything is working.

1. Open up a _terminal_ (`Terminal`, `cmd`, `Powershell`, `bash`, ...)
2. Run `wrenc -v`

You should see both the `wrenc` and Wren versions listed:

```
wrenc v0.1 (wren v0.4)
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


### Assignment Requirements

Please follow [these instructions][cli-walkthrough] to download exercism cli for your OS.

Once CLI is all setup & configured, download the first exercise - `hello-world`:

```bash
$ exercism download --exercise=hello-world --track=wren
```

Each assignment comes with everything it needs to run the tests.

[homebrew]: https://brew.sh
[releases]: https://github.com/joshgoebel/wren-console/releases
[wren-console]: https://github.com/joshgoebel/wren-console
[wren-cli]: https://github.com/wren-lang/wren-cli
[build-from-source]: https://github.com/joshgoebel/wren-console#to-build-wren-console
[cli-walkthrough]: https://exercism.io/cli-walkthrough