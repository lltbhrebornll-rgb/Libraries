local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Example "resource" part name to farm
local targetResourceName = “Money”

-- Autofarm loop
while true do
    -- Find nearest resource
    local nearest = nil
    local shortestDist = math.huge

    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == targetResourceName and obj:IsA("BasePart") then
            local dist = (obj.Position - character.PrimaryPart.Position).Magnitude
            if dist < shortestDist then
                shortestDist = dist
                nearest = obj
            end
        end
    end

    -- Move to resource
    if nearest then
        humanoid:MoveTo(nearest.Position)
        humanoid.MoveToFinished:Wait()

        -- "Collect" resource
        nearest:Destroy() -- For testing only
    end

    task.wait(1) -- small delay to avoid overload
