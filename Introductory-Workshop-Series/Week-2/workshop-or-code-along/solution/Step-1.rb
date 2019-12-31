use_bpm 120

########################## Step 1 ################################
#           Using variables and conditional statements           #
##################################################################

# This variable controls the note changes in the bass line and the melody live loops
isDark = false

# Kick drum
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

# Cymbals
live_loop :hihats do
  sample :drum_cymbal_closed, rate: 10, amp: 0.5
  sleep 1
end

# Melody
live_loop :melody, sync: :bass_drum do
  e3 = :e3
  e4 = :e4
  if isDark
    e3 = :eb3
    e4 = :eb4
  end

  use_synth :tri
  play :c3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play e3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :f3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :g3, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :c4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play e4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :f4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
  play :g4, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
end

# Bass line
live_loop :bass, sync: :bass_drum do
  a = :a1
  if isDark
    a =:ab1
  end

  use_synth :dsaw
  play :c2, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play :bb1, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play a, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
  play :bb1, cutoff: 70, amp: 0.5, sustain: 2, decay: 1, release: 1
  sleep 4
end
