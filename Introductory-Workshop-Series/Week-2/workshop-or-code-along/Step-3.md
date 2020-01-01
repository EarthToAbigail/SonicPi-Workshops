# Step 3 - Having fun with randomness

Using randomness is probably the easiest way to create something interesting without too much effort.
Basically, we let the computer do the work for us and decide on certain values. Randomness can be
applied in multiple ways. It can affect not only the notes played but also sound parameters or `sleep`
values. It's a great way to experiment and push your creativity!

Here an overview of some of my favorite methods and functions using randomness.

### `rrand` and `rrand_i`

These functions take 2 numbers as arguments and returns a value somewhere between them. `rrand` returns
a decimal number while `rrand_i` returns a whole number.

Here's an example that uses randomness to play a sample at various intervals and rates taken from
Sonic Pi's examples:

```
# Coded by Sam Aaron

live_loop :haunted do
  # Plays the :perc_bell sample at a speed between -1.5 and 1.5
  sample :perc_bell, rate: rrand(-1.5, 1.5)
  # Waits between 0.1 and 2 seconds before repeating the loop
  sleep rrand(0.1, 2)
end

```

### `one_in`

This function acts as an `if` statement combined with _probabilities_. It takes 1 argument, a number,
which acts a the base to calculate a probability in order to decide if it should execute the code.

Let's look at an example:

```
live_loop :awesome_loop do
  play :c3 if one_in(3) # Creates a 1 out of 3 chance that :c3 will play
  sleep 0.25
end
```

In the above example, there is **1 out of 3 chances** the code will execute. The higher the number
passed to `one_in`, the lower the chances the note or sample will play.

**Tip**: `one_in` is great for creating random beat sequences. You can play different drum samples
on top of each other and pass each one of them different values to `one_in`.

### `.take` and `.choose`

These 2 methods can be used separately or in combination with one another. `take` attaches itself to a
list and needs a number as argument. It then _takes_ the first values of the list until it reaches the
index number given as argument.

For example:

```
live_loop :awesome_loop do
  notes = (ring :c4, :d4, :e4, :f4, :g4, :a4, :b4, :c5).take(2).tick
  play notes
  sleep 0.5
end
```

In the above example, `take` will take the first 2 elements of the list (`:c4` and `:d4`) and will loop
over them using `tick`.

`choose` takes a list and _chooses_ a value in that list at random. For example, instead of using
`tick`, which plays one value after the other in a pre-determined order, with `choose` which will
pick a value within that list at random:

```
live_loop :awesome_loop do
  notes = (ring :c4, :d4, :e4, :f4, :g4, :a4, :b4, :c5).choose
  play notes
  sleep 0.5
end
```

We can also chain `take` and `choose` together, like so:

```
live_loop :awesome_loop do
  notes = (ring :c4, :d4, :e4, :f4, :g4, :a4, :b4, :c5).take(5).choose
  play notes
  sleep 0.5
end
```

We can combine take and choose together to create different effects and also easily change the music
dynamically will live coding!


### `use_random_seed`

When dealing with computers, nothing is _truly random_. Meaning, it _seems_ like randomness to us
humans but in the background, the computer is applying some "magical" calculation that allows it
to determine a value. That means that if you code something using randomness, the result might
_sound_ random but you will still get the exact same result every time you run your code.

`use_random_seed` is a function that allows us to _feed_ different values into the computer's calculations.
It helps to change the resulting patterns slightly. It's effect is more evident when you start working
with longer lists of notes or when you apply randomness in many places in your code but still, it's a
nice function to experiment with and see how the patterns change once the _seed_ changes.

It takes a number as argument. We can give it any number we want, no need for any logic thinking!
Just type in some digits, press `Run` and see if you like how it sounds. If not, change the number to
something else!

Here's how it looks like:

```
use_random_seed 117892 # Any number works, big or small
```

### Challenge

- Make the `:hihats` live loop more interesting by using more drum samples on top of each other and by using various forms of randomness covered in this step.

- Move on to [Step 4](./Step-4.md)

### Reference

:bulb: There's a great article written by Sam Aaron on how to **code a probalistic sequencer**. You can find
it by clicking on the `Help` tab in Sonic Pi and then `Tutorial`. Scroll down until section **A13**.
