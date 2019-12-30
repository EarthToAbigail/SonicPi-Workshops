# This is the file you need to change

# This changes the default speed of 60bpm to 120
use_bpm 120

###################### This is the template code we will work on ################################

# This loop takes care of the kick drum
live_loop :bass_drum do
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 4
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 2.5
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 1
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 0.5
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 4
  sample :bd_tek, amp: 2, cutoff: 60
  sleep 4
end

# This loop takes care of the cymbals
live_loop :hihats do
  sample :drum_cymbal_closed, rate: 10, amp: 0.5
  sleep 1
end

# This loops acts as our melody
live_loop :melody do
  use_synth :tri
  play :c3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :e3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :f3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :g3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :c4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :e4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :f4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :g4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
end

# This loop controls the bass line
live_loop :bass do
  use_synth :dsaw
  play :c2, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play :bb1, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play :a1, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play :bb1, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
end
