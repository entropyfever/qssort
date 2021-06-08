```
$ swipl --version
SWI-Prolog version 8.2.4 for x86_64-darwin
```

Hardware:

    Hardware Overview:

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


Software:

    System Software Overview:

      System Version: macOS Big Sur 11.4 (20F71)
      Kernel Version: Darwin 20.5.0
      Boot Volume: Macintosh HD
      Boot Mode: Normal
      Computer Name: MacBook Pro
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled




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