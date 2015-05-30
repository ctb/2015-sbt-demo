#! /usr/bin/env python
import sys, khmer, screed

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('query')
parser.add_argument('reads', nargs='+')
args = parser.parse_args()

kh = khmer.new_counting_hash(20, 1e7, 4)

for filename in args.reads:
   kh.consume_fasta(filename)

for record in screed.open(args.query):
   x = []
   for start in range(len(record.sequence) - kh.ksize() + 1):
      kmer = record.sequence[start:start + kh.ksize()]
      x.append(kh.get(kmer))
   x.sort()

   for first_nonzero in range(len(x)):
      if x[first_nonzero]:
         break

   print record.name, first_nonzero, len(record.sequence), \
              1.0 - (first_nonzero / float(len(record.sequence)))
