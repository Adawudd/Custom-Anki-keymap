# Custom-Anki-keymap/Anki Remote

A lightweight AutoHotkey-based utility that repurposes USB or RF “air mouse” style controllers (such as the G10 remote) for seamless Anki control—and can be easily adapted to other applications.

---

## Included Functions

- **Toggle Remap Mode**: Press **Play/Pause** to switch between **Remap ON** and normal keyboard behavior.
- **Arrow Key Remapping**: Map **↑**, **→**, **↓**, **←** to numerical answers **1**, **2**, **3**, **4** by default during Anki reviews (clockwise corresponding to the four Anki review options: Again (1), Hard (2), Good (3), Easy (4))., Hard (2), Good (3), Easy (4)).
- **Home / Browser_Back**: Sends **d** to return to the Anki homepage.
- **Page Down**: Sends **y** to sync with AnkiWeb.
- **Page Up**: Sends **e** to edit the current note.
- **AppsKey**: Sends **b** to browse cards (launch the browser).

---

## Installation

1. Install AutoHotkey v1.1+ if you haven’t already.
2. Download Anki Remote.ahk from this repository.
3. Place the script in a folder of your choice (e.g., C:\Users\YourName\Apps\Anki Remote\).

## Converting the AHK Script to an EXE (No Coding Required)
5. Open the AutoHotkey Dash (search for AutoHotkey in your Start Menu).
6. In the dashboard window, click "Compile" (this opens Ahk2Exe — the script-to-EXE converter).
7. In the window that opens:
- **Source (.ahk) file:** Click “Browse” and select your Anki Remote.ahk script.
- **Destination (.exe) file:** Choose where to save your EXE output.
8. Click "Convert" — this will generate your .exe file.
9. You can now run Anki Remote.exe directly without AutoHotkey installed. A tray icon indicates the script is active
```Notice
When you run the script, it won’t appear in your taskbar.
Instead, look for the tray icon in the bottom-right corner of your screen—click the arrow (^) symbol near the clock to
expand the hidden icons and find it there.
 ```
**Optional**: To launch automatically at login, create a shortcut to `Anki Remote.exe` in your Startup folder, e.g.:
   ```text
   C:\Users\YourName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
   ```

> **Reminder**: If your controller uses the same keys as your keyboard, those remapped shortcuts will also apply to your keyboard. Be sure to press **Play/Pause** to toggle **Remap OFF** when you’re done, so your keyboard returns to normal behavior.

---

## Usage

1. Press **Play/Pause** to enable **Remap ON** (you’ll see a tooltip).
2. **Answer review** cards with arrow keys:
   - **Up → 1**  
   - **Right → 2**  
   - **Down → 3**  
   - **Left → 4**
3. Press **Home** (Browser_Back) → sends **d** (return to deck list).
4. Press **Page Down** → sends **y** (sync).
5. Press **Page Up** → sends **e** (edit note).
6. Press **AppsKey** → sends **b** (browse cards).
7. Press **Play/Pause** again to restore normal keyboard behavior.

---

## Customization

### Re-editing the Button Mappings

1. Install AutoHotkey v1.1+ and clone or download this repository.
2. Open `Anki Remote.ahk` in any text editor.
3. Locate the `#If remapMode` block and update the hotkey definitions. For example, to change **Page Down** from **y** to **s**:
   ```ahk
   PgDn Up::Send, s
   ```
4. Save your changes and reload the script (or recompile to EXE).

### Identifying Your Controller’s Button Codes

you can modify your own script to include a KeyHistory trigger:

1. Open Anki Remote.ahk in any text editor.
2. Add the following line near the top (or anywhere outside conditional blocks):
```ahk
F2::KeyHistory
```
3. Save the script and run it.
4. Press the buttons on your controller.
5. In your system tray, find the green AutoHotkey H icon (you may need to click the arrow (^) near the clock to expand it).
6. Right-click the tray icon and select **Open** to bring up the console window.
7. In the open console window, press F2 on your keyboard. A key history log will appear showing lines like:
```sql
VK  SC   Type Up/Dn Elapsed Key     Window
--------------------------------------------
25  14B   d    0.12   Left    Anki
25  14B   u    0.19   Left
```
8. From that list, find the SC (Scan Code) and VK (Virtual Key) of the button you pressed.
9. Use the SC value to create a remapping in your script like:
```ahk
<ButtonName> Up::Send, <desired key>
```
Example:
```ahk
Browser_Back Up::Send, d
```
10. Save and reload the script to apply your changes. You're now mapping your controller exactly as needed.

---

---

## Quick Start & Caveats

**Yes**—it really is that simple for any controller that Windows already sees as a standard HID keyboard/media device:

1. **Download** the EXE (no AutoHotkey install needed).
2. **Run** it—you’ll see the little tray icon.
3. **Press** Play/Pause on your remote to flip into “Remap ON” mode.
4. **Use** your arrows, Backspace, Home, PgDn, PgUp, and AppsKey exactly as documented—everything should just work.

### Caveats to be aware of:

- **Controller compatibility**  
  Your remote must present itself to Windows as a keyboard (sending the same VK/SC codes we map). Most “air‑mouse” style dongles do this out of the box.

- **Shared keys with your real keyboard**  
  If your remote uses the exact same keys as your main keyboard, those mappings will apply there too—so always press Play/Pause to toggle **Remap OFF** when you’re done.

- **Administrator rights**  
  In rare setups, media‑key hooks or launching programs may require elevated privileges; if you see “access denied,” try running the EXE as administrator once.

- **Startup launch**  
  If you want it running all the time, just drop a shortcut to the EXE in your Startup folder:
  ```text
  %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
  ```

---

## Contributing

1. Fork this repository.
2. Make your enhancements or mappings.
3. Submit a Pull Request describing your changes and testing steps.

---

## License

Released under the **MIT License**. See [LICENSE](LICENSE) for full details.

