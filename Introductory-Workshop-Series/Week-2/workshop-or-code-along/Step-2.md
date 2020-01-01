# Step 2 - Optimizing the code using loops and lists

Right now, the code we have is pretty repetitive. The process of re-writing code to make it more
_elegant_ is called **refactoring**. An _elegant_ solution is code that finds an effective solution
for doing something by using just the right amount of code. _Elegance_ in programming is something
subjective that comes with practice. At some point, with practice, you'll develop you own opinion about
what is _elegant code_.

In this step, we're going to look at different ways we can achieve the same results by using fewer
lines of code and being less repetitive.

## Loops

In week 1, we covered a few types of basic loops. If you need a reminder, you can check out
[this link](https://github.com/EarthToAbigail/SonicPi-Workshops/blob/master/Summer-Camp-Naz-2018/Loops-and-Threads/Exercises.md) before moving on.

There are many different ways to loop something in Ruby. Here, we'll look at some more advanced ways
to play `your-awesome-tune` by refactoring our code and eliminating unnecessary repetitive lines of code.

### Playing timed patterns

`play_pattern_timed` is a Sonic Pi function (like `play` and `sleep`) that allows us to play a whole sequence
of notes using only 1 line of code. It takes 2 arguments, an `array` of notes and an `array` of sleep values.

Here's a small example:

```
play_pattern_timed [:c4, :d4, :e5, :f4], [1, 2, 1, 2]
```

This function comes in very handy when you have a long sequence of plays and sleeps. You can read more on
`play_pattern_timed` in Sonic Pi's documentation.

### Challenge

- Use `play_pattern_timed` to refactor the `:bass` live loop.


### `.each` - a handy Ruby method

`play_pattern_timed` is great but it only works with MIDI values. If we want to use samples, like for the drums
for example, we need to use a different method.

There are 2 general ways to have our code _do something_ in programming: using **functions** or **methods**.
Right now, we won't go very deep into the difference between functions and methods. For now, we'll just establish that
a function is an *action* that we need to *call* and give it the arguments it needs to work properly. We'll dive deeper into functions in the last step of this workshop.

For example, `play` and '`sleep` are both functions. `play` takes 1 argument, which is a note (name or number, as we saw in step 1). You can't use `play` without giving it a value (try and see the error that Sonic Pi gives you).

`sleep` works in a similar way, you can't *call* `sleep` without giving it a number as argument, the program will
error if you try.

A method is a bit different. It _attaches itself_ to a variable using _dot notation_ and executes an action on that
variable. The syntax is a bit different since it's the variable name that comes first, then a `.`, then the name of the
method. Here's a basic example using the Ruby method `.reverse`, copy/paste the code snippet in an empty Sonic Pi
buffer to see what it does:

```
myList = [1, 2, 3, 4, 5]
puts myList
puts myList.reverse

```

How is knowing that helping us? Well, there's a very convenient method we can use in Ruby to help us loop
over `arrays` while applying a certain action on *each element of the array*.

Here's an example:

```
myList = [1, 2, 3, 4, 5]

myList.each do |num|
  # First time through the list, num is 1. Second time, num is 2, etc...
  puts num + 2
end

# Outputs:
3
4
5
6
7
```

Since `.each` will execute a block of code on **each element of the list**, we need to put our code inside a
`do` / `end` block. The variable `num` is **the name of the variable representing each individual element of the
array** `myList`.

We can put as much code as we want inside the method's `do`/`end` block.

### Challenge

- Use `.each` to refactor the `:bass_drum` live loop.

:bulb: _Hint_: What's the value that is changing in that loop? Could you put these values into an `array`?


### tick, look and rings

Sonic Pi provides us with a built-in function called `tick`. Tick creates a **counter** that never stops until you
stop the program. That means that even if you are live coding using live loops and pressing `Run` again and again,
the counter will keep incrementing without resetting (unless you specifically tell it to reset). It comes with it's
counter-part called `look` that allows us **look up the value of** `tick` at any given time. What does this mean for
us? Combined with **rings**, `tick` and `look` provide a very effective way to move through a sequence of notes.

Let's look at an example, first without using rings:

```
# Here's what happens if we use tick and look with a simple array
live_loop :awesome_loop do
 tick
 puts look # Prints the value of tick to the console
 notes = [60, 62, 63, 65, 67, 68]
 play notes.look
 sleep 1
end
```

In the above example, the notes play only once because since tick is always incrementing, we end up reaching
the last index of our list without ever coming back to the beginning.

We could get around that by passing the value of `look` to a `modulo` operation, so that we always get back
numbers always in a certain range:

```
# Using the modulo operator to repeat the notes
live_loop :awesome_loop do
 tick
 puts look # Prints the value of tick to the console
 notes = [60, 62, 63, 65, 67, 68]
 # Here, since we are doing a mathematical operation, we need to use brackets [] instead of a dot .
 play notes[look % 6] # 6 is the length of my list
 sleep 1
end
```

Now we have our list of notes repeat over and over again. Still, the code looks a bit messy and not very
intuitive. Sonic Pi provides us a type of lists that **implicitely use the modulo operator so that we don't have
to write it ourself**. These special lists are called **rings**.

In the above example, if we change our notes array to use a ring instead, we get something like this:

```
# Using a ring instead of an array allows us to omit the modulo operation
live_loop :awesome_loop do
 tick
 puts look # Prints the value of tick to the console
 notes = (ring 60, 62, 63, 65, 67, 68)
 # No need for [] and % because we are using a ring
 play notes.look
 sleep 1
end
```

It's important to know that you can also attach `tick` to a variable, as you did with `.each`. So to
further improve our code above, we can get rid of the `puts` statements (we don't need them anymore since
we understand what `tick` does) and attach `tick` to our `notes` array.

Doing that allows us to get rid of `.look` and just pass the `notes` variable. If don't understand why, try
using `puts` to print the value of notes before calling `play`.

```
live_loop :awesome_loop do
 # We attach tick directly to the notes variable
 notes = (ring 60, 62, 63, 65, 67, 68).tick
 puts notes # Should print out a single value, not a list ;)
 # No need for [] and % because we are using a ring
 play notes
 sleep 1
end
```

### Challenge

- Refactor the `:melody` live loop using `ring` and `tick`.
- Move on to [Step 3](./Step-3.md) :tada:
