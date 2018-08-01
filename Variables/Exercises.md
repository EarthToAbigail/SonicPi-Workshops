# Understanding Variables

## What is a variable?

A variable is a piece of code that contains some information. Variables make our lives easier when we are programming because they allow us to save information in something that we can easily recognize, remember and reuse.

For example, let's say that I want my program to execute a mathematical operation. I can of course write the equation with numbers:

`2 + 2 = 4`

That seems very simple. But what happens if I want to do something with the answer? Or if I want to do some more complicated operation? Let's look at another example:

```
2 + 2 = 4
4 * 3 = 12
12 - 1 = 11
```

In the last example, I'm using the answer of the previous equation to do another operation. Let's see how this would look like if I used variable:

```
num1 = 2 + 2   // Now 'a' holds the value 4
num2 = num1 * 3   // 'b' holds the value of a * 3, which is 12
num3 = num2 - 1   // 'c' holds the value of 'b' - 1, which is 11
```
The beauty of this is that now I can play around with the variable and do even more complex operations without needing to type again all the equations. For example I can do:

```
mySum = num1 + num2 + num3   // 'mySum' now holds the value 27 (4 + 12 + 11)

```

Let's try and apply this to making music with SonicPi :D

Consider this piece of code (feel free to copy and paste it in a SonicPi buffer!)

```
note_1 = 60
note_2 = note_1 + 2
note_3 = note_2 + 2

play note_1
sleep 1
play note_2
sleep 1
play note_3
sleep 1
```
Now we don't need to remember all these annoying numbers! The best thing is that if we want to change the melodies and the notes we use, we only need to change the variable declaration:

```
note_1 = 65
note_2 = note_1 + 3
note_3 = note_2 + 2

play note_1
sleep 1
play note_2
sleep 1
play note_3
sleep 1
```
This already sounds very different then the first example we had!

## Some important things to know

### Variable declaration and assignment

Before we can use a variable in our code, we first need to **give it a name** and **assign it a value**. This is called **declaring a variable**. It's very important to understand that **we can't use a variable before declaring it**. Consider this next example:

```
note_1 = note_2 + 5
note_2 = note_1 + 3
note_3 = note_2 + 2

play note_1
sleep 1
play note_2
sleep 1
play note_3
sleep 1
```
If we try to run this code in SonicPi we will not hear anything, instead we will see a big error message.

![Alt text](images/error.jpg?raw=true "SonicPi Error Message")

If you read the error message carefully, you can see that SonicPi is throwing a `NameError` and seems to be complaining about the variable `note_2`. This is happening because we are trying to use the variable `note_2` before declaring it and assigning it a value. (We will cover error messages in a different workshop :D).

It's important to know that a variable declaration works from left to right. On the left you have the name that you want to give to your variable, followed by the `=` sign and on the right is the value that you want to assign to it.

### Naming conventions

Speaking about names, one thing that is helpful is to give our variables **names that are descriptive and will help us remember the information they are holding**.

For example, SonicPi already a bunch of declared variables built in that are ready for us to use. Until now we've been using numbers to say to SonicPi which note to play but we can also play these same notes by calling their variable name :D

Now, instead of typing numbers we can call these notes by their name like so:

```
play :c4  # -> play 60
sleep 1
play :d4  # -> play 62
sleep 1
play :e4  # -> play 64
sleep 1
```
In music, the notes are named with letters of the alphabet from `a` to `g`:

`A B C D E F G`

* The `:` indicates to SonicPi that we are using a built-in variable.
* The letter is the name of the note
* The number indicates **how high or low the note is** (1 is very low and 6 is very high).

The creator of the program could've decided to call these variable `xyz` or `n1, n2, n3` but instead he decided to call them by the actual name of the note. This makes it very easy to understand what this variable is for and what piece of information is inside it!

## Exercises

### Exercise 1

Copy and paste the following code in a SonicPi buffer. Try to modify the code so that it will use variable names instead of numbers. Try to use both built-in variable and declaring your own. The melody should still be the same after you changed the code!

```
use_bpm 100
use_synth :blade

2.times do
  play 57, amp: 1.2
  sleep 1
  play 57, amp: 1.2
  sleep 1
  play 64, amp: 1.2, release: 0.4
  sleep 0.5
  play 64, amp: 1.2, release: 0.4
  sleep 0.5
  play 65, amp: 1.2, release: 0.4
  sleep 0.5
  play 64, amp: 1.2, release: 0.4
  sleep 0.5
end
```
HINT: You can store any value in a variable! What would happen if
you used a variable for `amp:` or `release` ? ;-)

### Exercise 2

Create a melody by using variables instead of numbers. Try to add parameters to each note and store their value in a variable as well!

HINT: Try to use this exercise to explore different keyboards in SonicPi! On the first line, try to type `use_synth :` and see the list that comes up ;)

HINT 2: You can also read the built-in documentation to have more information on all the keyboards available.

### Exercise 3

Take the melody you created in Exercise 2 and try placing a `s` or `b` after the letter in the note name. For example, copy and paste this code in a SonicPi buffer:

```
use_bpm 60
use_synth :piano

play :c4
sleep 0.5
play :cs4
sleep 0.5
play :d4
sleep 0.5
play :ds4
sleep 0.5
play :e4
sleep 0.5
play :f4
sleep 0.5
play :fs4
sleep 0.5
play :g4
sleep 0.5
play :gs4
sleep 0.5
play :a4
sleep 0.5
play :as4
sleep 0.5
play :b4
sleep 0.5
play :c5
sleep 2

play :c5
sleep 0.5
play :b4
sleep 0.5
play :bb4
sleep 0.5
play :a4
sleep 0.5
play :ab4
sleep 0.5
play :g4
sleep 0.5
play :gb4
sleep 0.5
play :f4
sleep 0.5
play :e4
sleep 0.5
play :eb4
sleep 0.5
play :d4
sleep 0.5
play :db4
sleep 0.5
play :c4
sleep 2
```

Put together everything that you know about variables to create a new melody with your team mate!

HINT: You can also try to recreate melodies that you know! :sparkles: :musical_note: :smiley_cat:
