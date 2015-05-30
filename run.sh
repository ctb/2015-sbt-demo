#! /bin/bash
bt hashes both.hash 1
bt count both.hash 1e7 reads-a.fa filter-a.bf.bv
bt count both.hash 1e7 reads-b.fa filter-b.bf.bv

ls filter-?.bf.bv > filters-list.txt
bt build both.hash filters-list.txt entire.bf.bv
bt compress entire.bf.bv c_entire.bf.bv
