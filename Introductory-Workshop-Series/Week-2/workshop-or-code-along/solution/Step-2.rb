use_bpm 120

######################### Step 2 #################################
#                    Refactoring - loops, lists                  #
##################################################################

isDark = false

## Kick drum
live_loop :bass_drum do
  sl = [4, 2.5, 1, 0.5, 4, 4]
  sl.each do |s|
    sample :bd_tek, amp: 2, cutoff: 60
    sleep s
  end
end

# Cymbals
live_loop :hihats do
  sample :drum_cymbal_closed, rate: 10, amp: 0.5
  sleep 1
end

# Melody
live_loop :melody do
  e3 = :e3
  e4 = :e4
  if isDark
    e3 = :eb3
    e4 = :eb4
  end
  notes = (ring :c3, e3, :f3, :g3, :c4, e4, :f4, :g4).tick
  use_synth :tri
  play notes, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
end

# Bass line
live_loop :bass do
  a = :a1
  if isDark
    a =:ab1
  end
  use_synth :dsaw
  play_pattern_timed [:c2, :bb1, a, :bb1], [4, 4, 4, 4], cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
end
