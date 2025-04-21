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

1. **Download** `Anki Remote.exe` (the compiled EXE) and `Anki Remote.ahk` (the source script) from the Releases page.
2. **Place** them in a folder of your choice (e.g., `C:\Users\YourName\Apps\Anki Remote\`).
3. **Run** `Anki Remote.exe` manually whenever you need the controller mapping.
4. **Optional**: To launch automatically at login, create a shortcut to `Anki Remote.exe` in your Startup folder, e.g.:
   ```text
   C:\Users\YourName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
   ```
5. A tray icon indicates the script is active.

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

To support any controller, you need two values:
- **Device ID**: the USB/HID index for your controller.
- **Scan Code**: the numeric code each button sends.

Use the included `Monitor.ahk` script or AHK’s KeyHistory:

1. Place `Monitor.ahk` (or `Anki Remote.ahk` with `F2::KeyHistory`) alongside the `Lib` folder.
2. Run `Monitor.ahk` and watch the console for lines like:
   ```
   dev=2   code=0x122   state=down
   dev=2   code=0x122   state=up
   ```
3. Press a controller button and note the **dev** (Device ID) and **code** (Scan Code).
4. In `Anki Remote.ahk`, set:
   ```ahk
   remoteDevice := <your dev number>
   <BUTTON>_SC   := 0x<your scan code>
   ```
5. Reload or recompile—your controller will now map exactly as defined.

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

