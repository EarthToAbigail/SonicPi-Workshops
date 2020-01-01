# Step 4 - Understanding and using threads

In the previous step, we took a look at how we can play around with randomness to achieve
interesting results. Now, the cymbals in `your-awesome-tune` should play following a random
pattern. It's definitely more interesting then the single cymbal sound we had playing before but
there's still more we can do.

## Threads

What if you wanted to keep the simple cymbal you had previously and layer your random beat on top of it?
Right now, the only way we would have for doing that would be to create another live loop. But in this case,
it's not necessarily the best option because we'd like to keep all the cymbals together inside one live
loop.

Here's where `threads` come in. Threads allow you to stack independent blocks of code on top of each other.
It's a way to say to our program "Do _this_ at the **same time** as _that_".

Sonic Pi has its own function for working with threads called `in_thread`. `in_thread` takes a block of code
and executes it **at the same time as the block that follows it**.

Here's what the syntax looks like. In this next example, we are expecting to hear a steady bass drum over
a random cymbal:

```
live_loop :awesome_loop do
  # We use in_thread to create a block of code between the do / end keywords.
  in_thread do
    sample :drum_cymbal_closed, amp: 1.5, rate: 2.5 if one_in(2)
    sleep 0.25
  end
  # The second block of code starts here
  sample :bd_tek, amp: 0.5
  sleep 1
end
```

If you copy and run the code above, you'll probably notice that we are not exactly getting the expected
result. The sample `:bd_tek` plays steadily but it seems like we are hearing the `:drum_cymbal_closed` sample
way less than we should and also, not so randomly.

This is because, in order for threads to work well together, **each thread needs to have the same
duration**. In the last example, the first block has a `sleep` value of 0.25 while the second block has a
`sleep` value of 1. Since the first block is done much faster then the second, it waits for the second one
to finish before playing again.

There's a simple way to correct this: repeat the code block sufficient times so that the duration equals the
duration of the longer thread. In our case, `4 * 0.25 = 1` so if we repeat the first block 4 times, we'll match
the duration of the second block and everything should work as expected.

```
live_loop :awesome_loop do
  in_thread do
    # We repeat the threaded block of code 4 times to match the value of the code block that follows it
    4.times do
      sample :drum_cymbal_closed, amp: 1.5, rate: 2.5 if one_in(2)
      sleep 0.25
    end
  end
  # The second block of code starts here
  sample :bd_tek, amp: 0.5
  sleep 1
end
```

Now you should hear much more the `:drum_cymbal_closed` sample, since it's playing at an interval of 0.25 and `one_in`
is set to a high probability of hearing the sound (1 chance out of 2).

Threads can be chained one after the other as well:

```
live_loop :awesome_loop do
  in_thread do
    # Now the second thread is the one with the longest duration so we need to adjust
    # the amount of times we go through the loop
    8.times do
      sample :drum_cymbal_closed, amp: 1.5, rate: 2.5 if one_in(2)
      sleep 0.25
    end
  end
  # New thread here
  in_thread do
    sleep 1
    sample :drum_snare_soft, amp: 0.6
    sleep 1
  end

  # Now the previous block is the one with the longest duration so we need to adjust and put
  # the last block in a loop as well
  2.times do
    sample :bd_tek, amp: 0.5
    sleep 1
  end
end
```

### Challenge

Now it's your turn!

Before moving on to the final step, take a moment to explore what you learned by playing around with `your-awesome-tune` and giving it your own style.

Try to use different kinds of loops, play around with randomness in different ways and try out more `synths` and `samples` to discover new sounds. You can also experiment with different sound parameters. By playing around with them and hearing how they affect the sound you can discover new tips and tricks of your own!

If you need, you can have a look at [Step 4 in the solution folder](./solution/Step-4.md) to see how I customized the
template code to make it more interesting.

Let your creativity go wild! 🤠:musical_note: :computer:

When you're ready, check out the last step! Great job for making it this far! :tada: :smiley:

[Step 5](./Step-5)
