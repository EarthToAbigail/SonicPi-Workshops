# What do we mean by "Scopes" :interrobang: :flushed:

If we look up the definition of *scope* in the English dictionary we get something like this:

![Scope Definition](images/scope-definition.jpg?raw=true "Definition of Scope")

The last definition is interesting to us in the context of computer science: **"The range of the effect of an operator** such as a quantifier or conjunction."

So when we talk about scope, we mean **the range of a specific operation or variable inside our program**. There are in general **2** kinds of scopes: **global scope** and **local scope**.

## Global Scope :globe_with_meridians: vs Local Scope :mag:

When a variable has a *global scope* it means that the value of this variable is **available from everywhere in our program**. Let's look at some example code to try and understand this better.

```
use_bpm 90       # global scope
use_synth :piano # global scope
chord_vol = 1.4  # global scope

live_loop :chords do
  play chord(:a3, :minor, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:c4, :major, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:d4, :minor, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:e4, :dom7, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
end

live_loop :melody do
  play scale(:a4, :minor_pentatonic, num_octaves: 1).choose, amp: rrand(0, 1)
  sleep 0.25
end
```

In this example, we tell SonicPi to use the *piano* synth by using the built-in function `use_synth`. In this case, `use_synth` is used **globally**, which means that it will affect both the `:chords` and the `:melody` live loops (if you copy this code into SonicPi, you will hear that both loops are using the `piano` sound :smile:). If we wanted to use different synths for each loop we would need to call the `use_synth` function **locally** like this:


```
use_bpm 90       # global scope
chord_vol = 1.4  # global scope

live_loop :chords do
  use_synth :piano # local scope
  play chord(:a3, :minor, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:c4, :major, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:d4, :minor, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
  play chord(:e4, :dom7, num_octaves: 2), sustain: 2, decay: 1, amp: chord_vol
  sleep 2
end

live_loop :melody do
  use_synth :pluck # local scope
  play scale(:a4, :minor_pentatonic, num_octaves: 1).choose, amp: rrand(0, 1)
  sleep 0.25
end
```

In this last example, our *local scope* is the code that is executed **inside a loop**. *(We can also have nested local scopes, more on that later when we will see 'Conditional Statements'* :relaxed:*)* . Each loop has it's own scope, which is a local scope because the variables declared in that scope have an effect only within the scope of that particular loop. Any variable declared inside a local scope of a loop or function (we will see functions later on) **only has an effect inside that specific scope**.

To make it easier to understand, let's take a look at a *pseudocode representation* (what is pseudocode? Google is your friend! :stuck_out_tongue_winking_eye:):

```
# All variables declared here are in my **global scope**
# and I can use them anytime in my program.

var_1 = "something"
var_2 = "something_else"

live_loop :myCoolLoop do

  # anything happening here is in the **local scope of
  # the :myCoolLoop** live loop

  local_var = "something_i_need_inside_this_loop"

  # I can use var_1, var_2 and local_var here

end

live_loop :anotherCoolThing do

  # anything here is in the **local scope of the
  # :anotherCoolThing** live loop

  # I can use var_1, var_2 here
  # I **can't use local_var** because that variable is out
  # of scope inside this loop!

end
```

:sparkles: Before you continue with the next exercises, take some time to copy/paste the previous two examples into a SonicPi buffer and play around with them with your team mate :grinning: :headphones:

### Exercise 1

**Copy/paste this code in a SonicPi buffer**:

```
# I <3 Techno - Earth To Abigail

use_bpm 110
use_debug false

bd = :bd_haus
sn = :elec_lo_snare

vol_bd = 1.7
vol_sn = 0.8
vol_cym = 1

live_loop :drums do
  c = 100
  low_filter = 120

  with_fx :reverb do
    in_thread do
      2.times do
        sample bd, amp: vol_bd, lpf: low_filter, cutoff: c
        sleep 1.5
        sample bd, amp: vol_bd, lpf: low_filter, cutoff: c
        sleep 0.5
        sample sn, amp: vol_sn, pan: 0.3
        sleep 1.5
        2.times do
          sample bd, amp: vol_bd, lpf: low_filter, cutoff: c
          sleep 1
        end
        sample bd, amp: vol_bd, lpf: low_filter, cutoff: c
        sleep 0.5
        sample sn, amp: vol_sn, pan: 0.3
        sleep 2
      end
    end
    64.times do
      sample :drum_cymbal_pedal, amp: vol_cym, release: 0.05, rate: 3 if (spread 3,8).tick
      sample :drum_cymbal_closed, amp: vol_cym, release: 0.05, rate: 2 if (spread 6,8).look
      sleep 0.25
    end
  end
end

live_loop :bassLine, sync: :drums do
  use_synth :dsaw
  c = (line 80, 95, steps: 4).tick
  puts "c is " + c.to_s
  with_fx :slicer do
    play_pattern_timed [:e2, :g2, :a2, :b2, :d2], [4,4,4,2,2], amp: 0.9, release: 1, decay: 0.5, cutoff: c
  end
end

live_loop :computerSolo, sync: :bassLine do
  use_synth :prophet
  notes1 = (scale :e3, :minor_pentatonic, num_octaves: 2)
  notes2 = (scale :g4, :major_pentatonic, num_octaves: 2)
  64.times do
    p = (line -1, 1, steps: 64).tick
    puts "p is " + p.to_s
    play notes1.take(3).tick, amp: rrand(0.2, 0.7), release: 0.05, decay: 0.1, pan: p
    play notes2.choose, amp: rrand(0.4, 0.8), release: 0.05, decay: 0.1, pan: p
    sleep 0.25
  end
end
```
With your team mate, start by listening to what the code does. Then have a discussion together to answer the following questions:

* Where are the **global variables** and what do they do?
* Where are the **local variables**? What is their **scope**? What do they do inside that scope?

Once you both understand a little bit better what the code does, go ahead and play around with it! :grinning:

### Exercise 2

Work with a team mate to create loops of your own and apply different instruments to different loops by using `local scopes`. Find ways to **also use some variables globally**. Is there any way you could make your life easier by declaring a global variable and use it to change your code easily? :wink:

HINT :bulb: When musicians perform electronic music live, they usually use a *mixer* to mix all the different sounds together. A mixer controls the volume of each instrument (a mixer can do much more then that but let's focus on volume for now :blush:). What about creating your own mixer for your loops using `global variables` ? :sunglasses:
