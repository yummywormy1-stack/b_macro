# b_macro

Simple Roblox macro that presses the **B** key on a timer.

- **Toggle:** press **T** (in-game) to turn the macro on / off
- **Target key:** `B`
- **Interval:** one press every `CYCLE` seconds (default `1`)
- **Hold time:** the key stays down for `HOLD` seconds (default `0.15`)

Pressing **T** prints `[B-macro] ON` or `[B-macro] OFF` to the output so you can see the state.

## Usage

1. Open the script in Roblox Studio (or your executor).
2. Paste `b_macro.lua` into a `LocalScript` inside `StarterPlayerScripts`, or run it in your executor.
3. Press **T** in-game to start. Press **T** again to stop.

The macro injects the key press itself, so it keeps running while the game window is not focused.

## Settings

Edit the top of `b_macro.lua`:

| Setting | Default | Meaning |
| --- | --- | --- |
| `TARGET_KEY` | `Enum.KeyCode.B` | Key that gets pressed |
| `TOGGLE_KEY` | `Enum.KeyCode.T` | Key that toggles the macro |
| `CYCLE` | `1` | Seconds between presses |
| `HOLD` | `0.15` | Seconds the key stays held |

## Notes

Uses `VirtualInputManager:SendKeyEvent` and falls back to `VirtualUser` if that is unavailable.
