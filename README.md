# Custom Vim Configuration

This repository contains a curated and lightweight Vim configuration designed for smooth editing, visual feedback, and quick navigation. It includes preconfigured plugins (managed by `vim-plug`), a custom dark color scheme, and handy keyboard shortcuts.

---

## Installation & Setup

To use this configuration, you need to link the `vimrc` file and the repository folder to your home directory (`~/.vimrc` and `~/.vim`).

### Step 1: Clone the Repository
If you haven't already, clone this repository to your local machine (e.g., in a `~/projects/` or `~/dotfiles/` directory):
```bash
git clone <repository-url> ~/dotfiles/vim
```

### Step 2: Backup Existing Configuration
Before creating symlinks, backup any existing Vim configurations to avoid losing them:
```bash
mv ~/.vimrc ~/.vimrc.backup 2>/dev/null || true
mv ~/.vim ~/.vim.backup 2>/dev/null || true
```

### Step 3: Symlink the Configuration
Create soft links (symlinks) pointing from your home directory to the repository files:
```bash
# Symlink the vimrc file
ln -s ~/dotfiles/vim/vimrc ~/.vimrc

# Symlink the .vim directory
ln -s ~/dotfiles/vim ~/.vim
```

### Step 4: Install Plugins
The repository already includes the `vim-plug` manager in `autoload/plug.vim`. Simply launch Vim and run the install command:
```vim
:PlugInstall
```
This will download and configure all defined plugins inside the `plugged/` directory.

---

## Features

### 1. Plugin Ecosystem
Managed seamlessly via **[vim-plug](https://github.com/junegunn/vim-plug)**, this configuration includes:
* **[CtrlP](https://github.com/ctrlpvim/ctrlp.vim)**: An active and highly customizable fuzzy file, buffer, MRU, and tag finder.
* **[NERDTree](https://github.com/scrooloose/nerdtree)**: A tree-based file explorer to easily browse project directories.
* **[Gundo](https://github.com/sjl/gundo.vim)**: A visual undo tree visualizer that lets you navigate through your editing history.
* **[FZF](https://github.com/junegunn/fzf)**: A general-purpose command-line fuzzy finder for lightning-fast lookups.
* **[Syntastic](https://github.com/vim-syntastic/syntastic)**: A syntax-checking plugin that runs checkers on write and flags errors in the editor.
* **[YAPF](https://github.com/google/yapf)**: Integration for Python code formatting (optional plugin/command).

### 2. Custom Aesthetics & UI
* **Colorscheme**: Features the custom **Aurora** color scheme (`colors/aurora.vim`) with full syntax highlighting enabled (`syntax on`).
* **Line Numbers**: Standard line numbering (`set number`) is enabled for code readability.
* **Visual Guides**: 
  * Current line highlighting (`set cursorline`) to easily locate your cursor.
  * Bracket/parenthesis highlighting (`set showmatch`) for nested blocks.
* **Redraw Optimization**: Redraws are minimized when executing macros/commands for a smoother feel (`set lazyredraw`).
* **Command Autocomplete**: Interactive visual autocomplete menu for the command line (`set wildmenu`).

### 3. Key Mappings & Shortcuts
The map leader is set to the **Space** key (`let mapleader="\<space>"`).

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `jk` | Insert | Escape (acts as `<Esc>`) |
| `j` / `k` | Normal | Move cursor by *visual* wrapped lines rather than physical lines (`gj`/`gk`) |
| `<leader><space>` | Normal | Clear search highlights (`:nohlsearch`) |
| `<leader>u` | Normal | Toggle Gundo graphical undo visualizer |
| `<leader>ev` | Normal | Open this `vimrc` file in a vertical split |
| `<leader>eb` | Normal | Open `~/.bashrc` in a vertical split |
| `<leader>sv` | Normal | Source/reload the `vimrc` settings immediately |
| `<leader>s` | Normal | Save the current editing session (`:mksession`) (restore using `vim -S`) |
| `gV` | Normal | Visually select the last inserted text block |

### 4. Search & Indentation Settings
* **Fuzzy & Incremental Search**: Searches highlight matches as you type (`set incsearch`, `set hlsearch`).
* **Tab Rules**: Configured for 4-space indentation with soft-tab expansion (`set tabstop=4`, `set expandtab`).
* **Code Folding**: Enabled and set to fold by code indent (`set foldmethod=indent`). Supports modeline options (`set modelines=1`) to customize folding on a per-file basis.
* **Persistent History**: Keeps track of file backups and supports persistent undo history (`set undofile`) across sessions.
