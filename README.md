# WOAH - Workshop Object Action History

An F4SE plugin for Fallout 4 that keeps a history of the actions you make in workshop mode, so you can **undo and redo** them.

Built with [CommonLibF4](https://github.com/libxse/commonlibf4) using the
[commonlibf4-template](https://github.com/libxse/commonlibf4-template).

## Goals

> **Status: early development, not playable yet.** The plugin loads, reads its INI and detects the hotkeys. The history system itself is still to be built, see the [goals](#appendix-goals).

- [ ] 1. A working base that undoes and redoes any **scrapping**
- [ ] 2. Moving and placing history
- [ ] 3. MCM add-on to change keys in-game
- [ ] 4. Holotape add-on to change keys in-game
- [ ] 5. Controller compatibility
- [ ] 6. Old-gen (1.10.x) compatibility

## Features

- **Undo / redo for workshop actions**, driven by a hotkey. Both keys are configurable, and controller support is planned.
- **Save warning timer**: warns you when you have been building for a while without saving. Default is 15 minutes, and `0` turns the warning off.
- **Plain INI configuration**: everything can be edited in a text file, with no other mod needed.
- **Optional in-game config** (planned): a separate add-on, either an MCM page or a holotape (pick one), to change the keys without opening the INI.

## Requirements

- Fallout 4, targeting 1.11.240 (Next-Gen)
- [F4SE](https://f4se.silverlock.org/)
- Address Library for F4SE Plugins

## Configuration

Edit the INI next to the DLL. Changes are read when the game starts.

| Key | Section | Default | Meaning |
|---|---|---|---|
| `iModifier` | Keys | 16 (Shift) | Optional holding key. `0` = no modifier |
| `iAction1` | Keys | 90 (Z) | Action 1: **undo** |
| `iAction2` | Keys | 88 (X) | Action 2: **redo** |
| `fSaveWarnTime` | General | 15.0 | Minutes between save warnings. `0` = never warn |

**Keys:** values are Windows virtual-key codes. [Codes can be found here](https://fallout.wiki/wiki/Resource:Creation_Kit/DirectX_Scan_Codes)

**Modifier:** it stands for a key you hold while pressing the action key, such as Shift, Ctrl or Alt. It can also be a normal key (A, S, D, F...), though that is mostly unuseful for console scripters. If `iModifier` is `0`, the action keys work on their own.

## Building

Requires Visual Studio Build Tools (C++), the Windows SDK, [XMake](https://xmake.io/) and Git.

```
git clone --recurse-submodules <this repo>
cd <repo file location>
xmake project -k compile_commands
xmake build
```

The DLL is built `in build\windows\x64\release\` and copied to `package\F4SE\Plugins\.`

## License

Open source. See `LICENSE` and `EXCEPTIONS`; they come from CommonLibF4 and the template this project is built on.

## Credits

- The CommonLibF4 authors and maintainers
- The F4SE team
