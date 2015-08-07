# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
#IMPORT DATA FROM INTERNET
import urllib
import itertools
from itertools import groupby
data = urllib.urlopen("http://www.puzzlers.org/pub/wordlists/ospd.txt")
#CONVERT IT TO A LIST
scrabble = list(set(line.strip() for line in data))
##GROUP ANAGRAMS
anagrams = [list(group) for key,group in groupby(sorted(scrabble,key=sorted),sorted)]
#NUMBER OF NON ANAGRAMS
non_anagrams = [s for s in anagrams if len(s) < 2]
#PRINT NUMBER OF ANAGRAMS
print len(scrabble) - len(non_anagrams)

