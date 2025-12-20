## Utilities Menu for Windows 11 Desktop Context Menu
A simple set of utilities added to the Windows 11 desktop context menu for quick access to common tasks.

<img src="Extras/Preview.bmp" alt="Preview" width="100%" height="auto" />

## Features

- **Cleanup Memory**: Free up memory with by clearing the Working Sets, Standby List, and Modified Page List with the RAMMap Memory Cleanup Script. *(Requires RAMMap to be installed and added to PATH)*
- **Kill Not Responding Tasks**: Finds and kills all non-responding tasks
- **Kill Task Manager**: Forcibly closes the Task Manager process to resolve issues
- **MKLINK Assistant**: Assists in creating symbolic/hard links, and directory junctions using the MKLINK command
- **Refresh Icon Cache**: Refreshes the icon and thumbnail cache to fix icon display issues.
- **Restart Explorer**: Restarts Windows Explorer to resolve various UI issues
- **Restart Start Menu**: Restarts the Start Menu to resolve various UI issues
- **Verify Windows Integrity**: Verify and repair system files using the System File Checker (SFC) tool and Deployment Imaging Service and Management Tool (DISM)

[!IMPORTANT]
> [!WARNING]
> 🚨 **Known Issues**: The following bugs are known ad are currently being looked into. Please be patient as we attempt to fix them.
> 
> - **Refresh Icon Cache**: As of December 20 2025, this feature has stopped running from the context menu. The script is still available in the `Scripts` sub folder and works perfectly when executed directly. But, until I figure out why it refuses to trigger from the context menu, the context menu entree has been temporarily removed.

### Instructions

1. Download the ZIP file from the link below.
2. Extract the contents of the ZIP file to a folder of your choice.
3. Copy the `Utilities` folder to the root of your `C:` drive `(C:\Utilities)`.
4. Double-click the `Add Utilities Menu.reg` file to add the Utilities Menu to your desktop context menu.
5. To remove the Utilities Menu from your desktop context menu, double-click the `Remove Utilities Menu.reg` file.

**Download**: [Download ZIP](https://github.com/The-Back-Room/Utilities-Menu-for-Windows-11-Desktop-Context-Menu/archive/refs/heads/main.zip)
