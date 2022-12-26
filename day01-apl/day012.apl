#! /usr/bin/apl --script

inp ← ⎕FIO[26] 'input.txt'

(+\ ('('=inp) - (')'=inp)) ⍳ ¯1

)OFF

