# 🚀 Frozenbloo's Dotfiles

> A comprehensive collection of configuration files for a productive macOS development environment

[![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Fish Shell](https://img.shields.io/badge/Fish-4AAE47?style=flat&logo=fish&logoColor=white)](https://fishshell.com/)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white)](https://neovim.io/)
[![AeroSpace](https://img.shields.io/badge/AeroSpace-Window_Manager-blue)](https://nikitabobko.github.io/AeroSpace/)

## 📖 Overview

This repository contains my personal dotfiles and configuration settings for a modern macOS development setup. These configurations are tailored for productivity, aesthetics, and seamless workflow management.

## 🛠️ What's Included

### 🪟 Window Management & System UI
- **[AeroSpace](https://nikitabobko.github.io/AeroSpace/)** - Tiling window manager for macOS
- **[SketchyBar](https://github.com/FelixKratz/SketchyBar)** - Custom menu bar with system monitoring

### 💻 Development Tools
- **[Neovim](https://neovim.io/)** - Modern Vim-based text editor with custom configuration

### 🎨 Utilities & Customization
- **[Neofetch](https://github.com/dylanaraps/neofetch)** - System information display
- **iTerm2** - Terminal emulator settings

## 🚀 Quick Start

### Prerequisites
- macOS (tested on latest versions)
- [Homebrew](https://brew.sh/) package manager
- Git

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Frozenbloo/dotfiles.git ~/.config-backup
   cd ~/.config-backup
   ```

2. **Backup your existing configs (recommended):**
   ```bash
   mv ~/.config ~/.config-old
   ```

3. **Link the configurations:**
   ```bash
   ln -sf ~/.config-backup ~/.config
   ```

4. **Install required applications:**
   ```bash
   # Window management
   brew install --cask nikitabobko/tap/aerospace
   
   # Development tools
   brew install neovim
   brew install fish
   
   # System utilities
   brew tap FelixKratz/formulae
   brew install sketchybar
   brew install neofetch
   ```

## ⚙️ Configuration Highlights

### AeroSpace Window Manager
- **Automatic tiling** with smart workspace management
- **Borders integration** for visual feedback
- **Custom keybindings** for efficient navigation

### SketchyBar System Monitor
- **Real-time system stats** (CPU, battery, calendar)
- **Workspace indicators** with AeroSpace integration
- **Custom styling** with color themes

### Neovim Setup
- **Minimal configuration** focused on essential features
- **Custom keybindings** for quick file operations
- **Leader key** set to spacebar for intuitive shortcuts

## 🔧 Management Commands

### AeroSpace Daemon Management
The SketchyBar integration includes an AeroSpace daemon that monitors workspace state:

```bash
# Check daemon status
CONFIG_DIR="~/.config/sketchybar" ~/.config/sketchybar/plugins/aerospace_daemon_manager.sh status

# Restart the daemon
CONFIG_DIR="~/.config/sketchybar" ~/.config/sketchybar/plugins/aerospace_daemon_manager.sh restart

# Stop the daemon
CONFIG_DIR="~/.config/sketchybar" ~/.config/sketchybar/plugins/aerospace_daemon_manager.sh stop
```

### Service Management
```bash
# Start SketchyBar
brew services start sketchybar

# Reload AeroSpace config
aerospace reload-config
```

## 📁 Directory Structure

```
~/.config/
├── aerospace/          # AeroSpace window manager config
├── fish/              # Fish shell configuration
├── neofetch/          # System info display config
├── nvim/              # Neovim editor configuration
├── sketchybar/        # Custom menu bar setup
│   ├── colors.sh      # Color scheme definitions
│   ├── items/         # Menu bar components
│   └── plugins/       # System monitoring scripts
└── skhd/              # Hotkey daemon configuration
```
