cheatsheet do
  title 'Yazi'
  docset_file_name 'Yazi'
  keyword 'yazi'
  source_url 'http://cheat.kapeli.com'

  category do
    id 'Navigation'

    entry do
      command 'k'
      command 'Up'
      name 'Move the cursor up'
    end
    entry do
      command 'j'
      command 'Down'
      name 'Move the cursor down'
    end
    entry do
      command 'l'
      command 'Right'
      name 'Enter hovered directory'
    end
    entry do
      command 'h'
      command 'Left'
      name 'Leave the current directory and into its parent'
    end
    entry do
      command 'K'
      name 'Seek up 5 units in the preview'
    end
    entry do
      command 'J'
      name 'Seek down 5 units in the preview'
    end
    entry do
      command 'gg'
      name 'Move cursor to the top'
    end
    entry do
      command 'G'
      name 'Move cursor to the bottom'
    end
    entry do
      command 'z'
      name 'Jump to a directory using zoxide'
    end
    entry do
      command 'Z'
      name 'Jump to a directory or reveal a file using fzf'
    end
  end

  category do
    id 'File Operations'

    entry do
      command 'o'
      name 'Open selected files'
    end
    entry do
      command 'O'
      name 'Open selected files interactively'
    end
    entry do
      command 'Enter'
      name 'Open selected files'
    end
    entry do
      command 'Shift-Enter'
      name 'Open selected files interactively (some terminals don\'t support it yet)'
    end
    entry do
      command 'Tab'
      name 'Show the file information'
    end
    entry do
      command 'y'
      name 'Yank selected files (copy)'
    end
    entry do
      command 'x'
      name 'Yank selected files (cut)'
    end
    entry do
      command 'p'
      name 'Paste yanked files'
    end
    entry do
      command 'P'
      name 'Paste yanked files (overwrite if the destination exists)'
    end
    entry do
      command 'Y'
      command 'X'
      name 'Cancel the yank status'
    end
    entry do
      command 'd'
      name 'Trash selected files'
    end
    entry do
      command 'D'
      name 'Permanently delete selected files'
    end
    entry do
      command 'a'
      name 'Create a file (ends with / for directories)'
    end
    entry do
      command 'r'
      name 'Rename selected file(s)'
    end
    entry do
      command '.'
      name 'Toggle the visibility of hidden files'
    end
    entry do
      command ';'
      name 'Run a shell command'
    end
    entry do
      command ':'
      name 'Run a shell command (block until finishes)'
    end
    entry do
      command '-'
      name 'Symlink the absolute path of yanked files'
    end
    entry do
      command '_'
      name 'Symlink the relative path of yanked files'
    end
    entry do
      command 'Ctrl-'
      name 'Hardlink yanked files'
    end
  end

  category do
    id 'Selection'

    entry do
      command 'Space'
      name 'Toggle selection of hovered file/directory'
    end
    entry do
      command 'v'
      name 'Enter visual mode (selection mode)'
    end
    entry do
      command 'V'
      name 'Enter visual mode (unset mode)'
    end
    entry do
      command 'Ctrl-a'
      name 'Select all files'
    end
    entry do
      command 'Ctrl-r'
      name 'Inverse selection of all files'
    end
    entry do
      command 'Esc'
      name 'Cancel selection'
    end
  end

  category do
    id 'Copy Paths'

    entry do
      command 'cc'
      name 'Copy the file path'
    end
    entry do
      command 'cd'
      name 'Copy the directory path'
    end
    entry do
      command 'cf'
      name 'Copy the filename'
    end
    entry do
      command 'cn'
      name 'Copy the filename without extension'
    end
  end

  category do
    id 'Filter Files'

    entry do
      command 'f'
      name 'Filter files'
    end
  end

  category do
    id 'Find Files'

    entry do
      command '/'
      name 'Find next file'
    end
    entry do
      command '?'
      name 'Find previous file'
    end
    entry do
      command 'n'
      name 'Go to the next found'
    end
    entry do
      command 'N'
      name 'Go to the previous found'
    end
  end

  category do
    id 'Search Files'

    entry do
      command 's'
      name 'Search files by name using fd'
    end
    entry do
      command 'S'
      name 'Search files by content using ripgrep'
    end
    entry do
      command 'Ctrl-s'
      name 'Cancel the ongoing search'
    end
  end

  category do
    id 'Sorting'

    entry do
      command ',m'
      name 'Sort by modified time'
    end
    entry do
      command ',M'
      name 'Sort by modified time (reverse)'
    end
    entry do
      command ',b'
      name 'Sort by birth time'
    end
    entry do
      command ',B'
      name 'Sort by birth time (reverse)'
    end
    entry do
      command ',e'
      name 'Sort by file extension'
    end
    entry do
      command ',E'
      name 'Sort by file extension (reverse)'
    end
    entry do
      command ',a'
      name 'Sort alphabetically'
    end
    entry do
      command ',A'
      name 'Sort alphabetically (reverse)'
    end
    entry do
      command ',n'
      name 'Sort naturally'
    end
    entry do
      command ',N'
      name 'Sort naturally (reverse)'
    end
    entry do
      command ',s'
      name 'Sort by size'
    end
    entry do
      command ',S'
      name 'Sort by size (reverse)'
    end
    entry do
      command ',r'
      name 'Sort randomly'
    end
  end

  category do
    id 'Multi-Tab'

    entry do
      command 't'
      name 'Create a new tab with CWD'
    end
    entry do
      command '0 ... 9'
      name 'Switch to the n-th tab'
    end
    entry do
      command '['
      name 'Switch to the previous tab'
    end
    entry do
      command ']'
      name 'Switch to the next tab'
    end
    entry do
      command '{'
      name 'Swap current tab with previous tab'
    end
    entry do
      command '}'
      name 'Swap current tab with next tab'
    end
    entry do
      command 'Ctrl-c'
      name 'Close the current tab'
    end
  end

  notes <<-'END'
## About Yazi

Yazi is a blazing fast terminal file manager written in Rust, based on async I/O.

## Configuration

There are three configuration files for Yazi:

- `yazi.toml` - General configuration
- `keymap.toml` - Keybindings configuration
- `theme.toml` - Color scheme configuration

### Configuration File Locations

- `~/.config/yazi/` on Unix-like systems
- `%AppData%\yazi\config\` on Windows

## Resources

- [Website](https://yazi-rs.github.io/)
- [GitHub Repository](https://github.com/sxyazi/yazi)
  END
end
