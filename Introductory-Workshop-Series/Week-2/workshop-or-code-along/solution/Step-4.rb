use_bpm 120

# This is the path to my personal collection of samples on my computer.
# Here's the download link for these drum samples, you can download for free in exchange of your email address.
# The ones I use here are the drum samples in the 808 Mob Hip Hop sample pack:
# https://cymatics.fm/pages/free-download-vault
HIHATS = "~/Music/SAMPLES/Cymatics-Cobra-HipHop/Drum One Shots/Cymbals/Hihats - Closed/Cymatics - Cobra Closed Hihat "

######################### Step 4 #################################
#                        Polishing - Finishing Up                #
##################################################################

isDark = false

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
  # The next line creates a list of numbers from 1 to 13 inclusive
  num = *(1..13)
  with_fx :echo do
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
  end
  2.times do
    sample :drum_cymbal_closed, rate: 5, amp: 1.3
    sleep 1
  end
end

# Melody
live_loop :melody, sync: :bass_drum do
  # These 2 lines use the ternary operator, which is the question mark.
  # They have the same effect as an 'if' statement
  e3 = isDark ? :eb3 : :e3
  e4 = isDark ? :eb4 : :e4

  tick
  notes = (ring :c3, e3, :f3, :g3, :c4, e4, :f4, :g4)
  use_synth :tri
  play notes.look, amp: 0.7, release: 0.1, decay: 0.1, sustain: 0.25
  sleep 0.5
end

# Bass line
live_loop :bass, sync: :bass_drum do
  a = isDark ? :ab1 : :a1
  use_synth :dsaw
  with_fx :reverb, room: 0.8 do
    with_fx :slicer, phase: 0.25 do
      play_pattern_timed [:c2, :bb1, a, :bb1], [4, 4, 4, 4], cutoff: 70, amp: 0.8, sustain: 2, decay: 1, release: 1
    end
  end
end
