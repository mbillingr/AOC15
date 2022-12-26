#! /usr/bin/apl --script

inp ← ⎕FIO[26] 'input.txt'

# count number of '(' and ')' characters and take the difference
(+/'('=inp) - (+/')'=inp)

)OFF

