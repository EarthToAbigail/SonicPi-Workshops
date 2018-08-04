# Conditional Statements :white_check_mark: :negative_squared_cross_mark:

## What is it?

A `conditional statement` means **if something is true then do this**. This is called an `if statement`. It's also possible to expand the logic to an `if-else statement` by saying something like **if something is true then do this else do that**. In this last case, the program will check if the `if statement` is **true**. If it is, the program will execute the next block of code. If it's **false**, the program will default to executing the block of code inside the `else statement`.

It's also possible to chain if statements by inserting `else if` statements before the default `else` statement. This would be like saying **if something is true then do this, else if this other thing is true then do this instead, else just do that**.

## How to write conditional statements :pencil:

There are some operators that we use to write equations that will evaluate to `true` or `false`:

|  operator 	| condition   	|
|---	|---	|
|  `<` 	| `smaller then`   	|
|  `>` 	| `greater then`   	|
|   `<=`	|  `smaller or equal then` 	|
|   `>=`	|   `greater or equal then`	|
|   `==`	| `equal to`  	|
|   `!=`	|  `not equal to` 	|

The symbols for coding arithmetic expressions are:

|  operation 	|   	|
|---	|---	|
|  `+` 	|  `add` 	|
|   `-`	|  `substract` 	|
|   `*`	|   `multiply` *(equivalent to x)*	|
|   `/`	|  `divide` 	|
|  `%` 	|  `modulo` *(see following side note)* 	|

***
**Side Note**

You might not be familiar with the **modulo operator** (`%`). The `modulo operator` gives us the **remainder** of a division. For example, `4 % 2 = 0` because **4** is an **even number** and can be divided by **2** perfectly. On the other hand, `3 % 2 = 1` because **3** is an **odd number** and is not divisible by **2**. This is a classical example of a practical way to use the `modulo operator` to check if a number is `even` or `odd`. We will see in a bit how this can be useful when working with `loops` and `conditional statements` inside SonicPi :relaxed:
***


Usually, we will want to use a conditional statement when we are looping something. We will want to check the value of a specific variable in that loop and run a piece of code accordingly. For that it's important to know that in computer science **the first number is zero** :interrobang:

So if the computer counts a value, it will start counting at **0** *( 0, 1, 2, 3, ...)* . :confused:

Let's look at some examples:

`if i == 0`   ---->  if `i` is equal to `0` </br> *remember: **0** is the first number so equal to 0 could mean **the first time something happens***</br>

`if (i + 4) < 10`  ----->  if the value of `i` plus `4` is smaller then `10` </br>

`if i % 2 != 0` ------> if the `remainder of i` is **not** equal to `0` *(so it's an odd number)*


## Translating this to Ruby

Consider this piece of code:

```
8.times do |i|    # We loop the code 8 times
  puts i          # Write the value of i in the console
  if i < 4 then   # Here is our if statement
    play :c4      # If the condition is true, do this
    sleep 1
  else            # here is our else statement
    play :f4      # otherwise if the previous condition is false, do this
    sleep 1
  end             # end of the 'if'
end               # end of the loop
```

Let's go over this code one line at the time.

`8.times do |i|`

We've seen this before when looking at `do loops` in the workshop on [Loops and Threads](../Loops-andThreads/Exercises.md). What is new here is that we use a `variable` called `i`. </br>
`i` is a pre-declared variable that already lives inside SonicPi. It counts the number of times we have been through the loop. As long as `i < 8`, the loop will play *(remember, we start counting from **0** :heavy_exclamation_mark:)* .

`puts i`

`puts` is a useful instruction when we want to **see the value** of a specific variable at a moment in time. We can print anything with `puts` but in this case we are printing the value of the variable `i` every time we go through the loop.

![puts example](images/puts-example.jpg?raw=true "Example of usage of puts")

In this screenshot, you can see on the left the value of `i` being printed to the screen *(the blue numbers on the right)* . You can also see that the first value being printed is **0** which confirms what we've been learning about indexing and how SonicPi (and computer programs in general) starts to count from **0** and not 1 the way we are used to.

![puts example 2](images/puts-example-2.jpg?raw=true "Second example of usage of puts")

Similarly, the last value printed by the `puts` instruction in SonicPi is **7** and not 8. This brings us to the next line in our program:

`if i < 4 then`

Here we say to SonicPi that if `i` is smaller then 4 it should executed the piece of code that follows:

```
play :c4
sleep 1
```

So as long as `i` is smaller then **4** SonicPi will play `:c4` and `sleep 1`. This means that we will hear `:c4` **4 times** *(from 0 to 3 inclusive)* .

`else`

If the previous statement is `false` *(so `i` is equal or greater than 4)*, execute the piece of code that follows:

```
play :f4
sleep 1
```

In this case SonicPi will play `:f4` every time the value of `i` becomes equal or greater than **4** which means that we will hear `:f4` **4 times** *(from 4 to 7 inclusive)* .

`end`

This is the `end` keyword that closes the `if` statement inside our loop.

`end`

Finally, this is the `end` keyword that closes our loop.

:eyeglasses: Let's review this one last time step by step from the beginning:

* We create a `do` loop that will execute a certain number of times
* We use the `i` variable to keep track of the number of times we've already gone through the loop.
* We print the value of `i` using the `puts` keyword.
* We check if `i` is smaller then 4
* If yes, we play `:c4` and sleep for `1`
* If not, we play `:f4` and sleep for `1`
* We close the `if-else statement` with `end`
* We close the `do loop` with `end`

Before you go on with solving the next exercises, let's look at a more exciting version of something you can do with conditional statements :smirk: Go ahead and paste this code in a SonicPi buffer and listen to it! *(don't forget to change the value of the section variable as indicated in the comment in the code)* :grinning:

```
# Time Traveler - Earth To Abigail

use_bpm 115
section = "a"  # Try to change the 'section' variable to "b" ;)

live_loop :tick do
  cue :tick
  sleep 1
end

with_fx :reverb do
  live_loop :surreal do
    sample :ambi_choir, amp: 1.5, rate: 0.5, pitch: 0.5
    sleep 4
  end

  live_loop :beat do
    sample :bd_tek, amp: 1.4
    sleep 1
    sample :elec_lo_snare, amp: 0.5
    sleep 0.5
    sample :bd_tek, amp: 1.4
    sleep 1
    sample :bd_tek, amp: 1.4
    sleep 0.5
    sample :elec_lo_snare, amp: 0.5
    sleep 1
  end

  live_loop :hi_hats, sync: :beat do
    if section == "a"
      sample :drum_cymbal_closed, amp: 1.5, rate: 2, pan: -0.3 if (spread 6,8).tick
      sample :drum_cymbal_pedal, amp: rrand(0.0, 1.3), pan: 0.3, release: 0.05, rate: rrand(2.5,5)
      sleep 0.25
    else
      sleep 0.25
    end
  end


  live_loop :glitch, sync: :beat do
    with_fx :echo, phase: 0.5, decay: 8 do
      sleep 3
      sample :elec_cymbal, amp: 0.3, rate: 0.6, sustain: 2, decay: 1, pan: -0.3
      sleep 5
    end
  end

  live_loop :bass, sync: :beat do
    use_synth :tb303
    co = (line 50, 90, steps: 8).tick
    with_fx :slicer, phase: 0.25, amp: 0.2 do
      if section == "a"
        2.times do |i|
          i == 0 ? note = :a2 : note = :f2  # <---- This is another way to write if-else statements
          play note, cutoff: co, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4, amp: 1.6
          sleep 8
        end
      else
        4.times do |i|
          notes = [:a2, :g2, :fs2, :f2]
          play notes[i], cutoff: co, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4, amp: 1.6
          sleep 8
        end
      end
    end
  end
end
```

### Exercise 1

While pair programming, create a `do` loop that plays something different depending on the value of `i` .

*(You might want to review the workshops on [Variables](../Variables/Exercises.md) if you need to refresh your memory :relaxed:)*

### Exercise 2

**Copy/paste the following code** into one of your SonicPi buffers:

```
use_bpm 150

# Change the 'section' variable to "a", "b" or "c" to alternate between sections.
section = "a"

live_loop :tick do
  cue :tick
  sleep 1
end

with_fx :reverb, room: 0.8, mix: 0.3 do
  live_loop :drums, sync: :tick do
    puts "section " + section
    if section == "a"
      av = 2
      in_thread do
        sample :bd_tek, amp: av
        sleep 1
        sample :drum_cymbal_closed, amp: av
        sleep 1.5
        sample :bd_tek, amp: av
        sleep 0.5
        sample :drum_cymbal_closed, amp: av
        sleep 1
      end
      in_thread do
        16.times do
          sample :drum_cymbal_closed, amp: 1.4, rate: 2.5 if one_in(4)
          sample :drum_cymbal_pedal, amp: 1.4, rate: 3 if one_in(3)
          sample :drum_cymbal_closed, amp: rrand(0.0, 0.6), rate: 3
          sleep 0.25
        end
      end
      use_synth :dsaw
      with_fx :slicer do
        note = :b1
        play note, amp: 1.2, release: 1, decay: 0.6, cutoff: 80
        sleep 2.5
        play note, amp: 1.2, release: 1, decay: 0.6, cutoff: 80
        sleep 1.5
      end

    else if section == "b"
      in_thread do
        sample :bd_tek, amp: 2
        sleep 2
        sample :drum_cymbal_closed, amp: 2
        sleep 3
        sample :bd_tek, amp: 2
        sleep 1
        sample :drum_cymbal_closed, amp: 2
        sleep 2
      end
      in_thread do
        16.times do
          sample :drum_cymbal_closed, amp: 1.4, rate: 2.5 if one_in(4)
          sample :drum_cymbal_pedal, amp: 1.4, rate: 3 if one_in(3)
          sample :drum_cymbal_closed, amp: rrand(0.0, 0.6), rate: 3
          sleep 0.5
        end
      end
      use_synth :dsaw
      with_fx :slicer do
        note = :a1
        play note, amp: 1.2, release: 2, decay: 1, cutoff: 80
        sleep 5
        play note, amp: 1.2, release: 2, decay: 1, cutoff: 80
        sleep 3
      end

    else if section == "c"
      4.times do
        sample :bd_tek, amp: 2
        sleep 2
      end
      8.times do
        sample :bd_tek, amp: 2
        sleep 1
      end
      16.times do
        sample :bd_tek, amp: 2
        sleep 0.5
      end
      32.times do
        sample :bd_tek, amp: 2
        sleep 0.25
      end
      section = "a"

    else
      puts "invalid section value, reverting to a"
      section = "a"
      sleep 0.01
    end
  end
end
end
end
```

Discuss the code with your team mate to try and understand what is going on. It's perfectly normal if you don't understand everything! Focus you attention on these points:

* Where are the conditional `if-else` statements and what condition do they check?
* What happens in the code if that condition is `true`?
* What about if it's `false`?

Take some time to discuss the parts that you understand and do some research in the SonicPi documentation to find information on the keywords you never saw before *(for example, what does `rrand` do?* :smirk:*)* . You can find information on different keywords by clicking on the **Help** tab and then looking in the **Lang** section :muscle: :star:

Once you feel like you are starting to understand the code, go ahead and play with it with your team mate! You can change values, change the conditions, add more variables... The sky is the limit! :fireworks: :full_moon_with_face:

:bulb: Feel free to play around with the "*Time Traveler*" example as well :smile:

### Exercise 3

Create more loops using `if-else` statements but this time use `live_loops` and include some of the new things you learned by looking and playing around with the code in the previous exercise! :grinning:

***
Conditional statements gives you the power to change entire section of a song by changing only **1 letter** :grinning:. Be creative and find new ways to apply this knowledge to create awesome music of your own! :notes: :sparkles: :musical_keyboard:
