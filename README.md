# B macro

A small Roblox script that presses B repeatedly. Press T to start it, and T again to stop. The current state appears in the output.

## Run it

Run `b_macro.lua` in your supported environment, then press T in-game. The script tries to send key presses using `VirtualInputManager`, with `VirtualUser` as a fallback. Whether those methods work, including when Roblox is unfocused, depends on your environment and its permissions.

## Change the keys or timing

The settings are at the top of the script:

```lua
local TARGET_KEY = Enum.KeyCode.B
local TOGGLE_KEY = Enum.KeyCode.T
local CYCLE = 1
local HOLD = 0.15
```

`CYCLE` is the time in seconds between presses; `HOLD` is how long the key stays down. If neither input method works, the script stops and prints a warning.
