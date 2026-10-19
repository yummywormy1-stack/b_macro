local UserInputService = game:GetService("UserInputService")

local TARGET_KEY = Enum.KeyCode.B
local TOGGLE_KEY = Enum.KeyCode.T
local CYCLE = 1
local HOLD = 0.15

local running = false

local function getService(name)
	local ok, svc = pcall(function()
		return game:GetService(name)
	end)
	if ok then
		return svc
	end
	return nil
end

local VirtualInputManager = getService("VirtualInputManager")
local VirtualUser = getService("VirtualUser")

local function send(pressed)
	if not VirtualInputManager then
		return false
	end
	local ok = pcall(function()
		VirtualInputManager:SendKeyEvent(pressed, TARGET_KEY, false, game)
	end)
	if ok then
		return true
	end
	ok = pcall(function()
		VirtualInputManager:SendKeyEvent(pressed, TARGET_KEY, false)
	end)
	return ok
end

local function pressKey()
	if VirtualInputManager and send(true) then
		task.wait(HOLD)
		send(false)
		return true
	end
	if VirtualUser then
		local ok = pcall(function()
			VirtualUser:CaptureController()
			VirtualUser:SetKeyDown(TARGET_KEY.Name)
		end)
		if ok then
			task.wait(HOLD)
			pcall(function()
				VirtualUser:SetKeyUp(TARGET_KEY.Name)
			end)
			return true
		end
	end
	warn("[B-macro] no key injection method available")
	return false
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end
	if input.KeyCode == TOGGLE_KEY then
		running = not running
		print("[B-macro] " .. (running and "ON" or "OFF"))
	end
end)

task.spawn(function()
	while true do
		if running then
			if not pressKey() then
				running = false
			else
				local rest = CYCLE - HOLD
				if rest > 0 then
					task.wait(rest)
				end
			end
		else
			task.wait(0.25)
		end
	end
end)
