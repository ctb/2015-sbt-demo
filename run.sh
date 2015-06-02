#! /bin/bash
bt hashes both.hash 1
bt count both.hash 1000000 reads-a.fa filter-a.bf.bv
bt count both.hash 1000000 reads-b.fa filter-b.bf.bv

ls filter-?.bf.bv > filters-list.txt
bt build both.hash filters-list.txt entire.bf.bv
bt compress entire.bf.bv c_entire.bf.bv

echo Bloomtree contaiing reads-a.fa and reads-b.fa is in c_entire.bf.bv
