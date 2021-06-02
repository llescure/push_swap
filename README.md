# push_swap

Learn about sorting algorithms with a limited set of instructions while only using two stacks.

Set of instructions:
* sa : swap a - swap the first 2 elements at the top of stack a. Do nothing if there
is only one or no elements).
* sb : swap b - swap the first 2 elements at the top of stack b. Do nothing if there
is only one or no elements).
* ss : sa and sb at the same time.
* pa : push a - take the first element at the top of b and put it at the top of a. Do
nothing if b is empty.
* pb : push b - take the first element at the top of a and put it at the top of b. Do
nothing if a is empty.
* ra : rotate a - shift up all elements of stack a by 1. The first element becomes
the last one.
* rb : rotate b - shift up all elements of stack b by 1. The first element becomes
the last one.
* rr : ra and rb at the same time.
* rra : reverse rotate a - shift down all elements of stack a by 1. The flast element
becomes the first one.
* rrb : reverse rotate b - shift down all elements of stack b by 1. The flast element
becomes the first one.
* rrr : rra and rrb at the same time.

## Method:
I used double linked list to easily move forward and backward and avoid reallocating memory as would have been necessary with char *.

For 3 and 5 numbers I used the algorithm described in this article: https://medium.com/@jamierobertdawson/push-swap-the-least-amount-of-moves-with-two-stacks-d1e76a71789a

For 100 numbers I first used a copy of my double linked list. I sorted this copy with a simple algorithm : if the next number is inferior to the curent number then swap them.
Once sorted, I divided the stack into 3 and identified the last number of the first third (first pivot), the last number of the second third (second pivot) and the last number of the third third (last pivot).
With the pivot identified, I push everything that is inferior to the last pivot but superior to the second pivot to stack_b and then sort it following the same algorithm than the one I used for 5 numbers.
I then repeat the process for the numbers superior to the second pivot but inferior to the first pivot and finally the number inferior to the first pivot.

For 500 numbers, I used the same method than for 100 numbers except that I now divised the stack by 8 instead of 3.

I didn't use ss, rr and rrr which could have got me the extra point needed to get 100% on this project.

## Useful tips:
You can generate randomly numbers with the command `ruby -e "puts (first_number..last_number).to_a.shuffle.join(' ')"`

For instance if you want to generate 100 numbers randomnly you can type `ruby -e "puts (1..100).to_a.shuffle.join(' ')"`

## Tester:

You can test your program with my script: test.sh

```
make
sh test.sh
```

The error case will be tested and you will be then invited to enter a number of test as well as an interval to generate random number with the ruby command than I have mentioned above.

**Final score : 90/100**
