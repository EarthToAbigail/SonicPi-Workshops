# Loops and Threads :repeat_one: :repeat: :twisted_rightwards_arrows:

Until now, we've seen how to play a sequence of sounds one after the other by typing a different instruction every time we want to play a sound. But what happens if we want to repeat something over and over again? This is where `loops` come in handy :smile:

## Different ways to loop sounds

### Do Loops :repeat_one:

The first kind of loop that can be used when we want to repeat something **a fixed number of times** is a `do` loop (the correct term in computer science is a `do-while` loop, more on that later when we see conditional statements :smiley_cat:). We can do that by typing the **number** of times we want to repeat something, followed by a `.` and the keyword `times`, a space and the keyword `do`. On a new line we add the code we want to repeat and we finish by inserting another new line and the keyword `end` like so:

```
2.times do
  # do something here
end
```
***
***Side Note*** :pencil:

Any line starting with `#` will create a `comment` which is words that are not interpreted as code by SonicPi. You can use this, for example, for typing the name of your piece at the top of your buffer:

```
# Some Cool Title by Mynah M.
```

***

Let's take the first beat we created as an example. Try typing this into a SonicPi buffer:

```
use_bpm 100

4.times do
  sample :bd_sone
  sleep 1
  sample :drum_tom_lo_soft
  sleep 1.5
  sample :bd_sone
  sleep 0.5
  sample :drum_tom_lo_soft
  sleep 1
end
```

Now our beat is playing 4 times without the need for us to type 4 times the same thing :sunglasses:

### Live loops :repeat:

**Live loops** are a special kind of loop that exists only in SonicPi and allows us to **repeat something infinitely** until we decide to stop it. What makes `live loops` so special is that these loops also allow us to **change them without needing to stop the music**.

To create a live loop we can use the keyword `live_loop` followed by `:` and **a name for our loop** (can be anything which doesn't have white spaces). On a new line we put the code we want to repeat followed by another new line and the keyword `end`, like so:

```
live_loop :myNewBeat do
  # do something here
end
```

Go ahead and put the following code into a SonicPi buffer, you should hear that the beat keeps playing until you decide to stop the program:

```
use_bpm 100

bd_vol = 0.8
tom_vol = 1.2

live_loop :drums do
  sample :bd_sone, amp: bd_vol
  sleep 1
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1.5
  sample :bd_sone, amp: bd_vol
  sleep 0.5
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1
end
```

## Threads :twisted_rightwards_arrows:

`threads` have a different purpose than loops. Threads are different processes happening at the same time inside a program. They are what allow us to play different loops or sections on top of each other. SonicPi can be told to `do something at the same time as something else` by using the `in_thread` keyword followed by the keyword `do`, new line and the code we want to execute at the same time as something else, followed by a new line and the keyword `end`, like so:

```
in_thread do
  # do this
end
# at the same time as that
```

Let's use the same beat as example, but this time we will try to add a new cymbal sound that will just play a steady tick on top of our main beat. **Copy/paste this code in a SonicPi buffer** :grinning: :

```
use_bpm 100

bd_vol = 0.8
tom_vol = 1.2

live_loop :drums do
  in_thread do
    sample :drum_cymbal_pedal, amp: 0.5
    sleep 0.5
  end

  sample :bd_sone, amp: bd_vol
  sleep 1
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1.5
  sample :bd_sone, amp: bd_vol
  sleep 0.5
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1
end
```

If you run this code, you should hear that it's not giving exactly the result we expected, the cymbal only plays once and then waits for the drum loop to finish :confused:

This is happening because the `drums` loop is much longer then our single cymbal sound. **If we want the cymbals to repeat itself while the drum loop is happening we also need to loop the cymbal!**
:bulb: What we can do is calculate the amount of times the cymbal sound would happen inside a single drum loop. Let's add the total values of the `sleep` instructions and use that to calculate the number of times the cymbals should play:

```
use_bpm 100

bd_vol = 0.8
tom_vol = 1.2

live_loop :drums do
  in_thread do
    sample :drum_cymbal_pedal, amp: 0.3, rate: 2
    sleep 0.5
  end

  sample :bd_sone, amp: bd_vol
  sleep 1
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1.5
  sample :bd_sone, amp: bd_vol
  sleep 0.5
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1
end

# The sum of sleep is => 1 + 1.5 + 0.5 + 1 = 4
# Divided by the cymbal sleep => 4 / 0.5 = 8 times
```

Go ahead and paste this following code into a SonicPi buffer:

```
use_bpm 100

bd_vol = 0.8
tom_vol = 1.2

live_loop :drums do
  in_thread do
    8.times do
      sample :drum_cymbal_pedal, amp: 0.8
      sleep 0.5
    end
  end

  sample :bd_sone, amp: bd_vol
  sleep 1
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1.5
  sample :bd_sone, amp: bd_vol
  sleep 0.5
  sample :drum_tom_lo_soft, amp: tom_vol
  sleep 1
end
```

We created a `do` loop inside our bigger `live_loop`,  playing both loops at the same time and everything is syncing nicely together :v:

### Exercise 1

While pair programming create a melody or a beat that loops for a **fixed number of times**. Take the time to experiment with new synths and new samples! :musical_keyboard:

### Exercise 2

Create something that uses a `live_loop`. Experiment to change the code while SonicPi is still running (change something in your code then press the **Run** button again without stoping the music). What happens?

### Exercise 3

Use what you know about `loops` and `threads` to create a piece that uses a mix of different kinds of loops and threads. Be as creative as you want and don't be afraid to try new things! Especially, experiment to change your code live using `live_loops` and see if you can make interesting changes in the music while your program is running. If your code throws an error, try to read the error message and understand what SonicPi is trying to tell you. Don't be shy to ask your team mate and classmates for help if you need it! :musical_note: :question: :flushed:

***

With what we've seen so far you already have the tools to create interesting tracks of your own :sunglasses: Go ahead and have fun! :smiley_cat: :star:
