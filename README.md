# Setting up my Mac

This repository contains my personal dotfiles and configuration settings. The `config.sh` script provided in this repository allows you to easily set up these dotfiles in your home directory.

---

## Getting Started

To set up your environment with these dotfiles, follow these steps:

---

### Zsh

I use [Oh My Zsh](https://ohmyz.sh/) along with [iTerm2](https://iterm2.com/). Check their websites for the most up-to-date installation instructions.

---

### Prerequisites

- Install Homebrew: [https://brew.sh/](https://brew.sh/)
- Install Git and tmux:

  ```bash
  brew install git tmux
  ```

---

### Installation

1. **Clone the Repository**

   First, clone this repository to your local machine. Make sure you have SSH keys set up with your Git account:

   ```bash
   git clone https://github.com/othrif/dotfiles.git
   cd dotfiles
   ```

2. **Run the Configuration Script**

   The `config.sh` script will copy the dotfiles from the repository to your home directory. Make sure the script has execution permissions, and then run it:

   ```bash
   ./config.sh
   ```

   This script will copy the following dotfiles:

   - `.gitconfig`
   - `.zshrc`

---

## 🐍 Python Environment Setup

This repository also includes a complete guide to setting up a modern Python development environment for machine learning and deep learning on macOS — including support for Apple Silicon (M1/M2/M3) with Metal acceleration.

👉 **To get started, follow the instructions in [`Python_Setup.md`](./Python_Setup.md)**
