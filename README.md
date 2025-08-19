Tools and Utilities for Windows 11 Desktop Context Menus
====================================    

![Utilities Menu][Utilities_Preview]

### Tools Menu

- Classic Personlization Menu
  - Theme Settings
  - Color and Appearance
  - Desktop Background
  - Desktop Icon Settings
  - Mouse Pointers
  - Notification Area Icons
  - Screen Saver Settings
- Control Panel Menu
  - Category
  - All Items
  - All Tasks (God Mode)
- MicaForEveryone Menu | Addon
  - Start MicaForEveryone
  - Stop MicaForEveryone
- DWMBlurGlass Context Menu Entree| Addon

### Utilities Menu

- Kill Not Responding Tasks
- Refresh Icon Cache
- Restart Explorer
- Restart Explorer 7 | Addon

## Installation

- To install simply download the archive and extract the `Tools` folder into the root of your system drive; `C:\`.
  - To add the Tools menu to your desktop context menu, simply double-click the `Add Tools Menu to Desktop Context Menu.reg` file.
  - To add the Utilities menu to your desktop context menu, simply double-click the `Add Utilites Menu to Desktop Context Menu.reg` file to add the Utilities.
  - To install the addons, simply double-click the registry file to add whichever addons you want.

## Uninstallation

- To remove the Tools menu simply double-click the `Remove Tools Menu from Desktop Context Menu.reg` file.
- To remove the Utilities menu simply double-click the `Remove Utilities Menu from Desktop Context Menu.reg` file.
- To remove the addons without removing the Tools or Utilities menus, simply double-click the registry file to remove whichever addons you want to remove.

**Download**: [Download ZIP](https://github.com/The-Back-Room/Tools-and-Utilities-Menus-for-Windows-11-Desktop-Context-Menu/archive/refs/heads/main.zip)

<div align="center">
    <details>
        <summary>
            <h2>Important Notes</h2>
        </summary>
        <em>The <code>Explorer 7</code>, <code>DWMBlurGlass</code>, options are called on from subdirectories located inside the <code>Tools</code> folder. You will need to download the latest versions from the shortcuts provided.
        <br /><br />The <code>MicaForEveryone</code> menu relies on the <code>.msi</code> variation that is installed in a system location. As such it doesn't specify the location; Instead, it targets the <code>MicaForEveryone.App.exe</code> process created by the <code>.msi</code> installation method. For this reason, manual installations of <code>MicaForEveryone</code> might not be compatible with this menu.
        <br /><br />Due to Windows context menu limitations, addons may remove entrees from some of the sub menus in order to make space.</em>
    </details>
</div>

[Utilities_Preview]: Previews/Utilities%20Menu.png