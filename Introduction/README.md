# :sparkles: :tada: Introduction to SonicPi :star2: :musical_note: :headphones:

![Sonicpi Logog](images/sonicpi2.png?raw=true "SonicPi logo")

In this introduction we are going to take a tour of SonicPi and understand some basic key words that will allow us to create our first programs :smiley_cat:

## Taking a tour

* **Open up SonicPi**

The empty editor that you see is called a `buffer`. In total, SonicPi has **10 empty buffers** where you can write your code in.

![Buffers](images/buffers.jpg?raw=true "SonicPi buffers")

* **Preferences**

You can change your SonicPi settings by going to the **Prefs** tab:

![Tabs](images/tabs.jpg?raw=true "SonicPi Tabs")

In the preference pane, you have the option to choose between 2 different visual profiles, the light profile is the default or you can choose the dark profile like me :stuck_out_tongue_winking_eye:

![Preference Panel](images/preference-panel.jpg?raw=true "SonicPi Preference Panel")

* **Documentation**

If you get stuck at any point or you are looking for some inspiration, SonicPi has a wonderful set of tutorials and documentation to guide you through your learning journey and make code easy to understand. To access the documentation, just click on the **Help** tab next to **Prefs**.

![Help Panel](images/help.jpg?raw=true "SonicPi Help Panel")

  - The **Tutorial** tab is a collection of lessons and useful tips about all of SonicPi's features.
  - The **Examples** tab is a collection of musical pieces that you can paste in a buffer and experiment with. The first examples are simple and the last ones are very advanced. All of them could be used to learn some useful things and experiment with while you are learning how to create your own pieces.
  - The **Synths** tab gives you information on all the different keyboards that you can find in SonicPi.
  - The **Fx** tab gives you information on all the effects you can apply in our code to change the original sound of the keyboards or samples you are using (more on that later :relaxed:)
  - The **Samples** tab gives you information on all the different samples that are built-in Sonicpi
  - Finally, the **Lang** tab (lang for "language") gives the definition of all the different keywords you can use in your code (like a dictionnary for programmers :smile:). This is the documentation on the ruby language that SonicPi understands (more on reading documentation will come soon :blush:)

### Exercise 1 :computer: :book:

Take the time to discover the SonicPi interface with your team mate. Click on the different tabs, customize the look of SonicPi to your preference and read some of the documentation available in the `Help` tab.

## First Beeps

Ok, now that we have a first feel of the SonicPi interface it's time to start making our first sounds :smiley: We will start by learning two basic instructions: `play` and `sleep`.

You can play a melody by saying to SonicPi to `play` something. A `play` instruction is usually followed by a `sleep` instruction because the program needs to know how long it should wait before playing the next sound.

Open a SonicPi buffer and type in this code:

```
play 60
sleep 1
```

The number following `play` is the value of the sound. **60** is equal to **middle C** in music (don't worry if you don't know anything about music). Low numbers give very low sounds, high numbers give very high sounds. Sometimes, a frequency can be so low or so high that you can't even hear it (you can experiment with this :smiley:).

`sleep 1` tells SonicPi to wait **1 second** before playing the next sound. In the first example, we didn't have any more play instructions so the program just stopped executing. Now try and type this code into your SonicPi buffer:

```
play 60
sleep 1
play 64
sleep 1
play 67
sleep 1
```
Now we can clearly hear one sound being played after the other :relaxed:

For this next example, let's see what happens if we don't type any sleep instructions:

```
play 60
play 64
play 67
```

Wow! Now all the sounds are being played at the same time :smiley:

You can see how `sleep` instructions are useful but it's also possible to create interesting things by having different sounds being played at the same time.

This is an example of a very famous melody that is played using only `play` and `sleep` (Go ahead and **copy/paste this code** into a SonicPi buffer! :smile:):

```
play 60
sleep 0.5
play 60
sleep 0.5
play 62
sleep 1
play 60
sleep 1
play 65
sleep 1
play 64
sleep 2

play 60
sleep 0.5
play 60
sleep 0.5
play 62
sleep 1
play 60
sleep 1
play 67
sleep 1
play 65
sleep 2

play 60
sleep 0.5
play 60
sleep 0.5
play 72
sleep 1
play 69
sleep 1
play 65
sleep 1
play 64
sleep 1
play 62
sleep 1

play 70
sleep 0.5
play 70
sleep 0.5
play 69
sleep 1
play 65
sleep 1
play 67
sleep 1
play 65
sleep 2
```

## Creating Beats with samples :dancer:

Sometimes we don't necessarily want to create melodies. Maybe we want to play a beat! After all, fat beats are a big part of electronic music :grinning: The way we can play things like drum sounds is through using **samples**. There are many different kinds of samples in SonicPi but for now we will focus on the ones that are drum sounds. To play a specific sample, we use the `sample` keyword. For example, try writing this code in a SonicPi buffer:

```
sample :bd_sone
sleep 1
sample :drum_tom_lo_soft
sleep 1.5
sample :bd_sone
sleep 0.5
sample :drum_tom_lo_soft
sleep 1

sample :bd_sone
sleep 1
sample :drum_tom_lo_soft
sleep 1.5
sample :bd_sone
sleep 0.5
sample :drum_tom_lo_soft
sleep 1
```

When you type in the keyword `sample`, SonicPi will show you a drop down menu of all the samples available. Feel free to explore all of them! :smiley: :headphones:

### Exercise 2 :musical_note: :sparkles:

Pair with someone in the class and create a melody using only `play` and `sleep` instructions.

### Exercise 3

Pair with a different person then in the previous exercise and this time create a beat using SonicPi samples :sunglasses:

## Adding parameters to each sound :speaker:

The last thing we will see are **parameters that can help us change something in the way our sound is played**. For example, we might want some sounds to be louder then others. We can control the volume of each note by using the `amp:` parameter:

```
play 60, amp: 0.2
sleep 0.5
play 60, amp: 1.8
sleep 0.5
play 62, amp: 1
sleep 1
play 60, amp: 0
sleep 1
play 65, amp: 0.2
sleep 1
play 64, amp: 1.2
sleep 2

play 60, amp: 0.5
sleep 0.5
play 60, amp: 0
sleep 0.5
play 62, amp: 0.9
sleep 1
play 60, amp: 1.2
sleep 1
play 67, amp: 0.3
sleep 1
play 65, amp: 1.8
sleep 2

play 60, amp: 0
sleep 0.5
play 60, amp: 1
sleep 0.5
play 72, amp: 0.3
sleep 1
play 69, amp: 1.5
sleep 1
play 65, amp: 0.4
sleep 1
play 64, amp: 1
sleep 1
play 62, amp: 0.5
sleep 1

play 70, amp: 1.7
sleep 0.5
play 70, amp: 0.1
sleep 0.5
play 69, amp: 0.9
sleep 1
play 65, amp: 1.5
sleep 1
play 67, amp: 0
sleep 1
play 65, amp: 1.2
sleep 2
```

Some notes are louder then others because their `amp` parameter is higher. An `amp` of **0** will give complete silence and then the higher the number the louder the sound.

Some other useful parameters that are fun to play with are `attack` and `release`. Why don't you go ahead and read the SonicPi documentation on them to understand what these parameters do!  :eyeglasses: :smiley:


### Exercise 4

Take the melodies and beats you have created in **Exercise 2** and **3** and add different parameters to each sound. You can start by using `amp` and then read some of the SonicPi documentation on more parameters.

HINT :bulb: What happens if you put a value of `1` to `attack` on a `play 60` instruction?

Try this:

```
play 60, amp: 1.4, attack: 1
sleep 1
```
HINT 2 :bulb: What happens if you put a value of `-1` to `rate` when you play a `sample`? Try this:

```
sample :loop_amen_full, amp: 0.8, rate: -1
sleep sample_duration(:loop_amen_full)
```

Do you hear the sample being played backwards :interrobang: :smirk:

Feel free to read documentation on other parameters as well if you are curious! :open_mouth:).

***

:tada: **Congratulations!** :confetti_ball:, you have done your first steps into programming with SonicPi! :star: :notes: :muscle:
