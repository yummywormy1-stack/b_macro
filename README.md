# B macro

This is a simple Roblox macro that presses B once a second. Press T to turn it on, then press T again to stop it. You can check the output to see if it's on or off.

You can change the key, toggle, and timing at the top of the script. `CYCLE` is the time between presses and `HOLD` is how long the key is held down.

The script needs an environment that allows simulated key presses. It tries `VirtualInputManager` first and falls back to `VirtualUser`. It may not work while Roblox is unfocused, depending on your setup.
