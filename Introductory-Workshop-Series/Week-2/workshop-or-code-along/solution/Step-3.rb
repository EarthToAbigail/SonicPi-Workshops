use_bpm 120

HIHATS = "~/Music/SAMPLES/Cymatics-Cobra-HipHop/Drum One Shots/Cymbals/Hihats - Closed/Cymatics - Cobra Closed Hihat "


######################### Step 3 #################################
#                        Randomness                              #
##################################################################

isDark = true

# Kick drum
live_loop :bass_drum do
  sl = [4, 2.5, 1, 0.5, 4, 4]
  sl.each do |s|
    sample :bd_tek, amp: 2, cutoff: 60
    sleep s
  end
end

# Cymbals
live_loop :hihats do
  num = *(1..13)
  in_thread do
    8.times do
      sample HIHATS + "#{num.choose}.wav", rate: [1, 2, 5, 7].choose, pan: rrand(-1, 1), amp: 0.7 if one_in(2)
      sleep 0.25
    end
  end
  in_thread do
    8.times do
      sample HIHATS + "#{num.choose}.wav", rate: [0.5, 0.2, -0.5, -1, -0.2].choose, pan: rrand(-1, 1), amp: 0.7 if one_in(2)
      sleep 0.25
    end
  end
  2.times do
    sample :drum_cymbal_closed, rate: 5, amp: 1.3
    sleep 1
  end
end

# Melody
live_loop :melody, sync: :bass_drum do
  e3 = :e3
  e4 = :e4
  if isDark
    e3 = :eb3
    e4 = :eb4
  end
  tick
  notes = (ring :c3, e3, :f3, :g3, :c4, e4, :f4, :g4)
  use_synth :tri
  play notes.look, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
end

# Bass line
live_loop :bass, sync: :bass_drum do
  a = :a1
  if isDark
    a =:ab1
  end
  use_synth :dsaw
  play_pattern_timed [:c2, :bb1, a, :bb1], [4, 4, 4, 4], cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
end
