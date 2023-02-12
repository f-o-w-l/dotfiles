# dotfiles

Configuration files for:

- bash
- [Visual Studio Code](https://code.visualstudio.com/)
- [Sublime Text 4](https://www.sublimetext.com/)


## Installation

#### Visual Studio Code Linux/Windows setup
1. Use a soft symbolic link to replace keybindings.json and settings.json from VS Code's User folder with the files in `./Code/`.

- Linux User folder location: `$HOME/.config/Code/User/keybindings.json`
- Windows User folder location: `%APPDATA%\Code\User\keybindings.json`

#### Sublime Text 3 Linux/macOS setup:
1. Install Package Control from the Preferences tab of Sublime Text.
2. Use a soft symbolic link to replace Sublime Text's `Packages/User/` folder with the user folder for your operating system in `./Sublime_Text/`.
3. You're done! Package Control synchronizes the rest.
