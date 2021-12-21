-- new script v0.0.1
-- ?
--
-- llllllll.co/t/?
--
--
--
--    ▼ instructions below ▼
--
-- ?

include("hmm/lib/ooo")
lattice_=require("lattice")
s=require("sequins")
local shift=false
local file1="/home/we/dust/code/hmm/beats16_bpm150_Ultimate_Jack_Loops_014__BPM_150_.wav"

function init()
  ooo.init(1)
  ooo.load(file1)

  slices=s{1,2,3,4,5,6,7,8}
  divisions={1/32,1/16,1/8,1/4,1/2,1,2}
  rates={1/8,1/4,1/2,1,2,4}
  local duration=file_duration(file1)

  lattice=lattice_:new()
  pattern=lattice:new_pattern{
    action=function(t)

    end,
    division=1/8,
  }
  lattice:start()

  -- keep screen up to date
  clock.run(function()
    while true do
      update_screen()
      clock.sleep(1/15)
    end
  end)
end

function update_screen()
  redraw()
end

function key(k,z)
  if k==1 then
    shift=z==1
  end
  if shift then
    if k==1 then
    elseif k==2 then
    else
    end
  else
    if k==1 then
    elseif k==2 then
    else
    end
  end
end

function enc(k,d)
  if shift then
    if k==1 then
    elseif k==2 then
    else
    end
  else
    if k==1 then
    elseif k==2 then
    else
    end
  end
end

function redraw()
  screen.clear()

  screen.update()
end

function rerun()
  norns.script.load(norns.state.script)
end

function file_duration(filename)
  local ch,samples,samplerate=audio.file_info(filename)
  return samples/samplerate
end
