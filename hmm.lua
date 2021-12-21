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
  
  -- testing purposes
  ooo.load(1,file1)
  ooo.slew(1,0.01)
  current_file_duration=file_duration(file1)
  params:set("clock_tempo",150)
  

  num_slices=16
  slice_seq=s{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
  rate_seq=s{s{1}:count(16),s{-1,0.5,1},1,1,s{1,0.95,0.9,0.85,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.45,0.4}:all(),s{1}:count(16),s{-1}:count(4)}
  trigger_seq=s{s{1/4}:count(8),s{1/16}:count(8),s{1/4}:count(12),s{1/32}:count(20)}
  step_seq=s{s{1/4}:count(12),s{1/16}:count(8),s{1/4}:count(4),s{1/2}:count(4),s{1/32}:count(12)}
  
  option_divisions={1/32,1/24,1/16,1/12,1/10,1/8,1/6,1/4,1/3,1/2,1,2,3,4}
  option_rates={-4,-2,-1.75,-1.5,-1.25,-1,-3/4,-1/2,-1/4,-1/8,-1/16,1/16,1/8,1/4,1/2,3/4,1,1.25,1.5,1.75,2,4}
  

  lattice=lattice_:new()
  pos_current=0
  pattern_step=lattice:new_pattern{
    action=function(t)
      pos_current=(slice_seq()-1)/(num_slices)*current_file_duration
      pattern_step:set_division(step_seq())
    end,
    division=1/4,
  }
  pattern_trigger=lattice:new_pattern{
    action=function(t)
      ooo.seek(1,pos_current)
      ooo.rate(1,rate_seq())
      pattern_trigger:set_division(trigger_seq())
    end,
    division=1/4,
  }
  
  
  params:add_option("rate","rate",option_rates,17)
  params:set_action("rate",function(i)
    rate_seq=s{option_rates[i]}
  end)
  
  params:add_option("step","step",option_divisions,11)
  params:set_action("step",function(i)
    step_seq=s{option_divisions[i]}
  end)
  
  params:add_option("trigger","trigger",option_divisions,11)
  params:set_action("trigger",function(i)
    trigger_seq=s{option_divisions[i]}
  end)

  
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
