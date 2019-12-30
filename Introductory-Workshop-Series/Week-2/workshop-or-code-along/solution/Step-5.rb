use_bpm 120

HIHATS = "~/Music/SAMPLES/Cymatics-Cobra-HipHop/Drum One Shots/Cymbals/Hihats - Closed/Cymatics - Cobra Closed Hihat "


######################### Step 5 #################################
#                   Refactoring into functions                   #
##################################################################

isDark = true

def generate_cymbals rates, num
  nums = *(1..13)
  8.times do
    sample HIHATS + "#{nums.choose}.wav", rate: rates.choose, pan: rrand(-1, 1), amp: 0.7 if one_in(num)
    sleep 0.25
  end
end

def generate_mode bool
  e3 = bool ? :eb3 : :e3
  e4 = bool ? :eb4 : :e4
  (ring :c3, e3, :f3, :g3, :c4, e4, :f4, :g4)
end


# Kick drum
live_loop :bass_drum do
  sl = [4, 2.5, 1, 0.5, 4, 4]
  with_fx :compressor, pre_amp: 30 do
    sl.each do |s|
      sample :bd_tek, amp: 2, cutoff: 60
      sleep s
    end
  end
end

# Cymbals
live_loop :hihats do
  num = *(1..13)
  with_fx :echo do
    in_thread do
      generate_cymbals [1, 2, 5, 7], 2
    end
    in_thread do
      generate_cymbals [0.5, 0.2, -0.5, -1, -0.2], 3
    end
  end
  2.times do
    sample :drum_cymbal_closed, rate: 5, amp: 1.3
    sleep 1
  end
end

# Melody
use_random_seed 72463
live_loop :melody, sync: :bass_drum do
  tick
  notes = generate_mode isDark
  use_synth :tri
  with_fx :reverb, room: 0.9 do
    with_fx :bitcrusher, bits: 7 do
      play notes.choose, amp: rrand(0.4, 0.9), pan: (line -0.5, 0.5, steps: 4).look, release: 0.1, decay: 0.1, sustain: 0.25 if one_in(3)
      sleep 0.5
    end
  end
end

# Bass lines
live_loop :bass, sync: :bass_drum do
  a = isDark ? :ab1 : :a1
  use_synth :dsaw
  with_fx :reverb, room: 0.8 do
    with_fx :slicer, phase: 0.25 do
      play_pattern_timed [:c2, :bb1, a, :bb1], [4, 4, 4, 4], cutoff: 70, amp: 0.8, sustain: 2, decay: 1, release: 1
    end
  end
end
