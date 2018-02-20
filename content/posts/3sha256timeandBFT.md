---
title: "3 - SHA256, time, and BFT"
date: 2018-02-19T16:50:46-05:00
draft: false
---
Hello.  This week, I've primarily been looking at some of the fundamentals behind Bitcoin.  

Specifically, I've been doing a deep dive into SHA256, with an eye toward implementing SHA1/SHA256 in Python (or C if I'm feeling ambitious) to look at some attacking possibilities.  I'm also trying to pin down what specific security needs these algorithms are intended to satisfy.  Thinking like an attacker, the first, best strategy for exploiting a security system is asking "What kind of attack are they trying to prevent, and how can I gain the thing that this attack intends to gain, while performing a completely different attack?"  

As a trivial example of this thought process, if someone answers a consensus problem by incentivizing honest node behavior and democratizing power over the blockchain, a Sybil attack seeks to bypass these safeguards via playing by different rules.  This is the give and take of security: Eve wants to, say, forge the blockchain.  So, we democratize power over it equally to Alice, Bob, and Eve.  So, Eve attacks the democratization by posing as several nodes.  Whatever tactic we use to prevent Eve's strategy will, more likely than not, introduce more opportunities to exploit.  The point is that Eve doesn't bother trying to further empower her node unless that's easy; rather, she lets the democratization of power defeat her "Eve, the 1-node bad actor" power, but then seeks to undermine *what the democratization was supposed to get us* (limit 1 actor's power via limiting 1 node's power).  One of the things that strengthens attackers so much in general is that further safeguards against the Sybil attack represent *more vulnerability* than just a line of dominos (defeat the anti-Sybil so you can defeat the democratization so you can forge blockchain), because those safeguards could (and in most systems, usually will) establish entirely new exploit possibilities.  Suppose we implement an anti-Sybil mechanism and inadvertently provide a dramatically easier way to de-anonymize nodes than just tracing historical transactions.  This opens a whole new class of attacks.

Anyway, to this end I've primarily been focused on reading the [NIST](https://csrc.nist.gov/Projects/Hash-Functions/NIST-Policy-on-Hash-Functions) specification of SHA256, [FIPS 180-4](http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf).  Regarding the security reasoning behind all this, [this bitcointalk thread](https://bitcointalk.org/index.php?topic=45456.0) is very interesting.  I've also found some implementations, such as [the one in an answer here](https://stackoverflow.com/questions/11937192/sha-256-pseuedocode) (Python), and [this library by Github user Nayuki](https://github.com/nayuki/Bitcoin-Cryptography-Library) (mostly C++ and Java), and of course, the [implementation](https://github.com/bitcoin/bitcoin/blob/master/src/crypto/sha256.cpp) in Bitcoin Core.  Given that Python is what I know and it's used a lot, I plan to focus a lot of my digging into [the hashlib Python module](https://docs.python.org/2/library/hashlib.html), which is used by [python-bitcoinlib](https://github.com/petertodd/python-bitcoinlib), [pycoin](https://github.com/richardkiss/pycoin), and [pybitcointools](https://github.com/vbuterin/pybitcointools/tree/aeb0a2bbb8bbfe421432d776c649650eaeb882a5).

I've also been looking at Byzantine Fault Tolerance and time in distributed systems, as I continue to believe that both of those general concepts are roughly the most important ones in the space.  Byzantine Fault Tolerance, or consensus in distributed systems generally, that is the prize.  Time in distributed systems is probably the major engineering challenge.  To put that last thought another way, the ability to determine, in a distributed system, what happened and when, is more or less the ability to protect against any attacks on the network.  One could even argue that these problems collapse into each other: achieving consensus without a centralized authority (and therefore without guarantees on the honesty or integrity of individual nodes), just is being able to specify what happened and when in a distributed system.  After all, the original Byzantine Generals paper solves the overarching problem via *signed messages*.  And the only important thing about signing a message is its integrity guarantee.... which brings us back to Sybil attacks and finding ways around things.  All signatures do is guarantee integrity.  The assumption, that, say, only Alice knows her own private key is not something we can (ever!) guarantee cryptographically.  

A similar problem is, as every cryptographer knows, that there is a necessary gap between the mathematical security guarantee of a cryptographic construct, and any implementation of that construct.  This is precisely why I'm looking at SHA implementations; not to find vulnerabilities in the fundamental algorithm (if I could do that, I'd be getting paid by Google, not paying John Jay), but to find attack surfaces in real world implementations.

For all these reasons, again, the question of attacking the blockchain is in reality the question: "What kind of security does a user want from a blockchain and its underlying crypto, and how can we violate it?"  So, evaluating blockchain security boils down to enumerating the things a blockchain might be used to get us, what further social engineering, implementation, and other vulnerability sources emerge in a system addressing those needs, and (as much as is possible) specifying and quantifying what it takes to exploit those vulnerabilities.  Going a little deeper, one needs to understand time in distributed systems, as well as BFT consensus, to understand *what kinds of things* you can get from a blockchain in the first place (as opposed to from, say, a relational database, or a simple digital signature or Merkle tree of signatures).  

I'm not sure how helpful these entries are for CSCI 385.  I'll try to attend a lecture this week or next to get a feel for where that class is at.  If perhaps you are one of these students, and less interested in my thoughts about security and more interested in something current, another noteworthy thing I've looked at this week is [this video](https://youtu.be/2Zlcgt8FVz4), which discusses some of the practical algorithms people are looking for to get what Proof-of-Work gets us (BFT, consensus).  For my purposes, this kind of thing is on the periphery; for better or worse, Proof-of-Work is the algorithm we have, and it *is* BFT, it *did* get implemented widely, and people *will* try to leverage it into new tech (not to mention hoard Bitcoin).  However, the criticisms of Proof-of-Work and descriptions of attacks on Bitcoin are, potentially, relevant.  For example, the fundamental idea that "No one will attack the network because if you had all that capacity to rewrite history, you'd just use it to mine honestly," bears some further consideration...  Yes, it would be better (for you) to honestly mine than it would be to take over and forge forever.  But is that more profitable than forging for an hour, then mining honestly going forward?  Or selling your ASICs off after you pull off your attack?  The video also has a nice rant against Proof-of-Stake, and starts to get into talk of governance, etc.  This may or may not be the real meat of public blockchain security talk.  Only time will tell.

And with that, I will return to studying some dry algorithmic specification and Python code.