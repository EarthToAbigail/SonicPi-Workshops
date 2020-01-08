## Bytebeat code:

```
echo "main(t){for(t=0;;t++)putchar(((t >> 10) & 42) * t);}" |gcc -x c - && ./a.out |aplay
```

```
echo "main(i){for(i=0;;i++)putchar(((i*(i>>8|i>>9)&46&i>>8))^(i&i>>13|i>>6));}" | gcc -x c - && ./a.out | aplay
```

```
echo "main(t){for(t=0;;t++)putchar(((t<<1)^((t<<1)+(t>>7)&t>>12))|t>>(4-(1^7&(t>>19)))|t>>7);}" |gcc -x c - && ./a.out |aplay

// Source: https://codegolf.stackexchange.com/questions/4746/write-the-prettiest-bytebeat-composition
```
## Tidal Cycle example code:

Tutorial:
https://tidalcycles.org/index.php/Tutorial

```
stack[sound "[bd bd] [bd [sd [sd sd] sd] sd]", sound "[pluck pluck] hh:2 hh:2 [hh hh hh hh]"]
```
```
first:
sound "[bd bd bd sd cp sd cp]"

then add the coma:
sound "[bd bd bd, sd cp sd cp]"
```
