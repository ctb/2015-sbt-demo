Demo data for checking out Sequence Bloom Trees,

https://github.com/Kingsford-Group/bloomtree

----

Setup
-----

Build the fake data (genome-a.fa, genome-b.fa, reads-a.fa, reads-b.fa) from
instructions at https://github.com/dib-lab/2015-khmer-wok4-multimap, taking
all output reads (so coverage of ~100).

Make a third fake genome (genome-c.fa) with:

../nullgraph/make-random-genome.py -l 1000 -s 3 --name='genomeC' > genome-c.fa

Execution
---------

Build a bloomtree from reads-a.fa and reads-b.fa with 'run.sh'::

   ./run.sh

Then, build a query from genomes A and C::

   cat genome-a.fa genome-c.fa | grep -v ^'>' > query.in

Run the query::

   bt query -t 0.8 c_entire.bf.bv query.in query.out

CTB 5/30/15
