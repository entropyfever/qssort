# Sort a queue using a temporary stack with minimum number of operations

## Problem

Suppose we have N natural numbers in a queue. ex queue = [3, 14, 1, 20] and an empty stack

We are allowed to make only two actions / operations:

- Action "Q": Deque an element from the queue and push it to the stack.
- Action "S": Pop an element from the stack and enque it in the queue.

In the above example, the following actions sort the queue in ascending order:

Actions: "QQSQSSQQSS"

ex.

- queue: 3, 14, 1, 20 stack:
- Q
- queue: 14, 1, 20 stack: 3
- Q
- queue: 1, 20 stack: 14, 3
- S
- queue: 1, 20, 14 stack: 3
- Q
- queue: 20, 14 stack: 1, 3
- S
- queue: 20, 14, 1 stack: 3
- S
- queue: 20, 14, 1, 3 stack:
- Q
- queue: 14, 1, 3 stack: 20
- Q
- queue: 1, 3 stack: 14, 20
- S
- queue: 1, 3, 14 stack: 20
- S
- queue: 1, 3, 14, 20 stack:

and the queue is sorted.



There is a trivial solution:

You can just rotate the queue by actions: "QS" (move the first number to the end of the queue) and when you reach the largest number, push it to the stack. Repeat this process until the queue is empty. The stack now contains all the numbers with the top being the smallest number. So you just pop them out one by one and you have a sorted queue.

## Solution (minimum number of actions to sort the queue)

Search the solution space by using BFS and making one action at a time.


```
$ swipl --version
SWI-Prolog version 8.2.4 for x86_64-darwin
```

## Results

```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- qssort('qs1.txt', G).
G = "QQSQSSQQSS".

?- qssort('qs2.txt', G).
G = "QQQQSQSSSQSSQS".

?- qssort('qs3.txt', G).
G = "QQSQQSQSSS".

?- qssort('qs4.txt', G).
G = "QQQQSSSS".

?- qssort('qs5.txt', G).
G = "empty".

?- qssort('qs6.txt', G).
G = "QQSSQQSS".

?- qssort('qs7.txt', G).
G = "QQSQSSQQSQQSQQQSSSSSQS".

?- qssort('qs8.txt', G).
G = "QQQSQSQQSSQSQSQSSSQS".

?- qssort('qs9.txt', G).
G = "QSQSQQQSQSSQQSQQSQSSQSSSQQSS".

?- qssort('qs10.txt', G).
G = "QQQQQQQQQQQQQQSSQSSSSSQSSSSSQSSSSS".
```


## STATS for nerds

### Hardware:

####    Hardware Overview:

```
      Model Name: MacBook Pro
      Model Identifier: MacBookPro15,1
      Processor Name: 6-Core Intel Core i7
      Processor Speed: 2.6 GHz
      Number of Processors: 1
      Total Number of Cores: 6
      L2 Cache (per Core): 256 KB
      L3 Cache: 12 MB
      Hyper-Threading Technology: Enabled
      Memory: 16 GB
```

### Software:

####    System Software Overview:

```
      System Version: macOS Big Sur 11.4 (20F71)
      Kernel Version: Darwin 20.5.0
      Boot Volume: Macintosh HD
      Boot Mode: Normal
      Computer Name: MacBook Pro -
      User Name: -
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled
```

#### Testcases statistics

```
$ swipl -f qssort.pl -t qs1
```
```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

% 154,850 inferences, 0.026 CPU in 0.030 seconds (87% CPU, 5954624 Lips)
QQSQSSQQSS
% Started at Tue Jun  8 16:25:30 2021
% 0.065 seconds cpu time for 239,463 inferences
% 5,607 atoms, 4,192 functors, 2,957 predicates, 38 modules, 104,099 VM-codes
% 
%                     Limit   Allocated      In use
% Local  stack:           -       52 Kb    1,464  b
% Global stack:           -      128 Kb       24 Kb
% Trail  stack:           -       34 Kb    3,960  b
%        Total:    1,907 Mb      214 Kb       30 Kb
% 
% 2 garbage collections gained 190,536 bytes in 0.000 seconds.
% 3 atom garbage collections gained 623 atoms in 0.001 seconds.
% 5 clause garbage collections gained 123 clauses in 0.000 seconds.
% Stack shifts: 1 local, 1 global, 0 trail in 0.000 seconds
% 2 threads, 0 finished threads used 0.000 seconds
% halt
```
```
$ swipl -f qssort.pl -t qs9
```
```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

% 41,790,731 inferences, 6.779 CPU in 7.047 seconds (96% CPU, 6164468 Lips)
QQSSQQQSQSSQQSQQQSSSQSSSQQSS
% Started at Tue Jun  8 16:25:42 2021
% 7.078 seconds cpu time for 41,875,344 inferences
% 5,610 atoms, 4,192 functors, 2,957 predicates, 38 modules, 4,002,982 VM-codes
% 
%                     Limit   Allocated      In use
% Local  stack:           -       52 Kb    1,464  b
% Global stack:           -      256 Mb      226 Mb
% Trail  stack:           -      128 Mb       33 Mb
%        Total:    1,907 Mb      384 Mb      259 Mb
% 
% 15 garbage collections gained 571,011,872 bytes in 0.771 seconds.
% 3 atom garbage collections gained 624 atoms in 0.001 seconds.
% 5 clause garbage collections gained 123 clauses in 0.000 seconds.
% Stack shifts: 1 local, 12 global, 12 trail in 0.130 seconds
% 2 threads, 0 finished threads used 0.000 seconds
% halt
```
```
$ swipl -f qssort.pl -t qs10
```
```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

% 174,892,631 inferences, 32.415 CPU in 35.196 seconds (92% CPU, 5395371 Lips)
QQQQQQQQQQQQQQQSSSSSSSQSSSSSQSSSSS
% Started at Tue Jun  8 16:25:57 2021
% 34.915 seconds cpu time for 174,977,244 inferences
% 5,606 atoms, 4,192 functors, 2,957 predicates, 38 modules, 15,946,348 VM-codes
% 
%                     Limit   Allocated      In use
% Local  stack:           -       52 Kb    1,464  b
% Global stack:           -    1,632 Mb    1,095 Mb
% Trail  stack:           -      275 Mb       71 Mb
%        Total:    1,907 Mb    1,907 Mb    1,167 Mb
% 
% 17 garbage collections gained 2,562,362,488 bytes in 5.428 seconds.
% 3 atom garbage collections gained 624 atoms in 0.001 seconds.
% 5 clause garbage collections gained 123 clauses in 0.000 seconds.
% Stack shifts: 3 local, 16 global, 16 trail in 1.310 seconds
% 2 threads, 0 finished threads used 0.000 seconds
% halt
```