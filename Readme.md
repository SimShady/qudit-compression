# qudit‑compression

**`qudit‑compression`** is a proof of concept tool for experimenting with compression of qubit circuits. For more information on how it works, read my bachelor thesis available [here](https://github.com/SimShady/bachelor-thesis)

## Getting Started

1. **Clone the repo**
   `git clone https://github.com/SimShady/qudit-compression.git`
   `cd qudit-compression`

2. **Install dependencies**
   `pip install -r requirements.txt`

3. **Run experiments**
   The `main.py` program gives examples on how to use the library. `processing.py` is the entry point.
   The program will output a `circuit.json` that contains information of the compressed circuit.

4. **Inspect compressed circuits**
   * Use `circuitinfo.py` to inspect `circuit.json` files.

## Why Use Nix + Flakes + Direnv?

I use **Nix Flakes** + **direnv** to manage reproducible development environments. This allows anyone to reliably enter a shell with all dependencies installed, regardless of the local system setup.

Below is a brief introduction.

### What is Nix / Flakes?

* **Nix** is a package manager and build system that ensures reproducible builds: it isolates dependencies so that “it works on my machine” becomes less of a problem.
* A **Flake** is a newer Nix mechanism for packaging and distributing reproducible development environments, including dependencies, build instructions, and configuration in a unified way.
* With a flake, you can define exactly which Python version, libraries, or external tools your project needs.

### What is direnv?

* **direnv** is a tool that lets you automatically load environment settings when you `cd` into a directory.
* In this repo, `.envrc` is configured to hook into Nix: when you enter the repo directory, you’ll automatically get a shell with the dependencies and environment variables set (thanks to Nix).

### How to Use the Flake + Direnv

Here’s a step-by-step guide for someone who has never used Nix:

1. **Install Nix**
   Follow the instructions at [nixos.org](https://nixos.org) to install the Nix package manager on your OS (Linux, macOS, etc.).
   During installation, allow **flakes** support if prompted (or enable experimentally).

2. **Install direnv**
   On many systems:
   `sudo apt install direnv`   (e.g. on Debian/Ubuntu)
   `brew install direnv`       (on macOS with Homebrew)

   Then add the `direnv` hook to your shell (e.g. in `.bashrc` or `.zshrc`):
   `eval "$(direnv hook bash)"`
   or for zsh:
   `eval "$(direnv hook zsh)"`

3. **Allow the .envrc in this project**
   After cloning the repo above, you’ll see a `.envrc`. You need to allow it:
   `direnv allow`
   Doing so tells `direnv` you trust this `.envrc`.

4. **Enter the Nix-powered shell**
   Now, whenever you `cd` into the project directory, `direnv` will automatically activate a shell environment defined by the flake.
   In this shell, dependencies (Python, etc.) are available automatically — you shouldn’t need to manually `pip install` (unless you want to override or extend things).

5. **Running commands inside the flake shell**
   Inside that shell, you can run:
   `python main.py`
   or other Python scripts, and they will see the correct dependencies.

6. **Why this is nice**

   * No need for virtualenv or manual pip installs per project.
   * Environment is reproducible: others who clone + `direnv allow` will have the same versions.
   * You can extend or pin dependency versions in `flake.nix`.

## License

This project is licensed under **GPL‑3.0**. See the `LICENSE` file for full terms.
