# 🧠 Deep Learning Environment Setup (macOS with Apple Silicon)

This guide helps you set up a full-featured Python deep learning environment on macOS using `pyenv`, `pyenv-virtualenv`, and `Homebrew`. It includes support for Apple Silicon (M1/M2/M3) with PyTorch + Metal (MPS), and good practices for per-project virtual environments.

---

## 🛠️ 1. Prerequisites

### ✅ Install Homebrew

If you haven't already:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## 🔧 2. Install Python Environment Tools

```bash
brew install pyenv pyenv-virtualenv xz
```

---

## 🧩 3. Shell Configuration

### Add to `~/.zprofile` (for login shells):

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Add to `~/.zshrc` (for interactive shells):

```bash
# pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Then apply the changes:

```bash
exec zsh
```

---

## 🐍 4. Install Python Versions

```bash
pyenv install --list                    # See all available versions
pyenv install 3.12.10                   # Latest stable
pyenv virtualenv 3.12.10 base           # Base dev environment
pyenv global 3.12.10                    # Set global default
pyenv local base                        # Use base in current directory
```

---

## 📦 5. Install Core Deep Learning Packages

Make sure you're in the `base` environment:

```bash
pyenv local base
```

Then install packages:

```bash
# Upgrade core tooling
pip install --upgrade pip setuptools wheel

# Deep Learning Libraries
pip install torch torchvision torchaudio
pip install transformers accelerate bitsandbytes huggingface_hub

# Development Tools
pip install jupyterlab ipykernel rich tqdm

# Data Science Stack
pip install numpy pandas matplotlib seaborn scikit-learn datasets

# Optional Training Tools
pip install tensorboard

```

---

## 🍎 6. PyTorch for Apple Silicon (Metal / MPS Support)

### Create a separate environment for MPS:

```bash
pyenv virtualenv 3.12.10 pytorch
pyenv local pytorch
```

### Install nightly PyTorch build with Metal support:

```bash
pip install --upgrade pip
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cpu
```

### Test MPS support:

```python
import torch

if torch.backends.mps.is_available():
    mps_device = torch.device("mps")
    x = torch.ones(1, device=mps_device)
    print(x)
else:
    print("MPS device not found.")
```

---

## 🧪 7. Best Practices: Per-Project Virtual Environments

To isolate dependencies for each project:

### ✅ One-time setup per project:

```bash
pyenv virtualenv 3.12.10 myproject-env
mkdir myproject && cd myproject
pyenv local myproject-env
```

This creates a `.python-version` file so `pyenv` automatically activates the environment when you `cd` into the project.

### 📌 Project structure:

```
myproject/
├── .python-version         # Automatically activates env
├── requirements.txt
├── notebooks/
└── src/
```

---

## 🔄 Useful Commands

| Action                     | Command                                      |
|----------------------------|-----------------------------------------------|
| List all possible versions | `pyenv install --list`                        |
| List all Python versions   | `pyenv versions`                             |
| Install new Python         | `pyenv install 3.x.x`                        |
| Create virtualenv          | `pyenv virtualenv 3.x.x my-env`             |
| Set env for project        | `pyenv local my-env`                        |
| Show active Python version | `pyenv version`                             |
| Upgrade pip/tools          | `pip install --upgrade pip setuptools wheel`|

---

## ✅ You're All Set!

You now have a modular, isolated, and Apple-Silicon-optimized deep learning environment using PyTorch and Hugging Face tools, with full Python project hygiene. 🚀
