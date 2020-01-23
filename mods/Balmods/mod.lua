function HandleCheats(str)
  local resources = { "energy", "magma" }

  if (str == "rich") then
    ThisPlayer.EnergyStored = ThisPlayer.EnergyStorageCapacity
    ThisPlayer.MagmaStored = ThisPlayer.MagmaStorageCapacity
    AddMessage("MODDED!!!")
    Cheater = true

  elseif (str == "poor") then
    ThisPlayer.EnergyStored = 0
    ThisPlayer.MagmaStored = 0
    AddMessage("Bankruptcy !")
    Cheater = true

  elseif (str == "reveal") then
    RevealMap()
    Cheater = true

  elseif (str == "fow on") then
    SetFogOfWar(true)
    Cheater = true

  elseif (str == "fow off") then
    SetFogOfWar(false)
    Cheater = true
 
  elseif (str == "see all") then
    SetFogOfWar(false)
    RevealMap()
    Cheater = true

  elseif (str == "fast debug") then
    SetSpeedBuild(10)
    SetSpeedTrain(10)
    AddMessage("FAST DEBUG SPEED")
    Cheater = true

  elseif (str == "normal debug") then
    SetSpeedBuild(1)
    SetSpeedTrain(1)
    AddMessage("NORMAL DEBUG SPEED")
    Cheater = true

  elseif (str == "speed cheat") then
    if (GetSpeedBuild() ~= 1) then
      SetSpeedBuild(1)
      SetSpeedTrain(1)
      AddMessage("NO SPEED!")
    else
      SetSpeedBuild(10)
      SetSpeedTrain(10)
      ThisPlayer.EnergyStored = ThisPlayer.EnergyStored + 32000
      ThisPlayer.MagmaStored = ThisPlayer.MagmaStored + 32000
      AddMessage("SPEED!")
    end
    Cheater = true

  elseif (str == "victory") then
    StopGame(GameVictory)
    Cheater = true

  elseif (str == "defeat") then
    StopGame(GameDefeat)
    Cheater = true

  elseif (str == "draw") then
    StopGame(GameDraw)
    Cheater = true

  elseif (str == "godcheat") then
    if (GetGodMode()) then
      SetGodMode(false)
      AddMessage("God Mode OFF")
    else
      SetGodMode(true)
      AddMessage("God Mode ON")
    end
    Cheater = true

  elseif (str == "fill mana") then
    for i = 0,ThisPlayer.TotalNumUnits-1 do
      SetUnitVariable(ThisPlayer.Units[i].Slot, "Mana", 999999)
    end
    Cheater = true

  elseif (string.sub(str, 1, 6) == "gimme ") then
    local arr = {}
    for w in string.gmatch(str,"[%w%p]+") do
      table.insert(arr, w)
    end

    local unittype = arr[2]
    local count = tonumber(arr[3])
    if (count == nil or count < 1) then
      count = 1
    elseif (count > 9) then
      count = 9
    end

    if UI.MouseViewport == nil then
      AddMessage("Cannot give you units until you point at a location.")
    else
      local tilex = UI.MouseViewport:Viewport2MapX(CursorX)
      local tiley = UI.MouseViewport:Viewport2MapY(CursorY)

      for i = 1, count do
        CreateUnit(unittype, "this", {tilex, tiley})
      end
    end

    AddMessage("Cheater!")
    Cheater = true

  else
    return false
  end
  return true
end