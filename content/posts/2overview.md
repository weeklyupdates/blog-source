---
title: "2overview"
date: 2018-02-11T12:27:41-05:00
draft: false
---

Hello.  This entry will detail some of the work I've done in the past week or so, as well as describe a bit of an overview of my process.  

Addressing the latter first, with papers like this, the early planning stage is generally comprised of 3 steps: 

1) Clarify the question my thesis statement seeks to answer.  
2) Identify an entrypoint for researching the historical and conceptual background of the topic.  
3) Identify an entrypoint for researching the present state of the topic.

Once (1) is done to satisfaction, the purpose of (2) and (3) is, in my mind, to follow each side of a Lady and the Tramp pasta strand (or candle burning at both ends, if you prefer) toward a completed paper.  I never consciously thought of this technique, but I realize that I've done it for the last several academic projects I've worked on, so I may as well make it explicit.

As for (1), the question (as it currently stands; it could be refined and made more specific as we go) I'm looking to answer is: 

__"How can one provide a security analysis for a Bitcoin-style blockchain project?"__ 

This question decomposes to: 

"What are the attack vectors on a blockchain project, and how can the attack surface be quantified (and how precisely)?"
"What security breaches have occurred in the blockchain space?  Why did they happen?  What technical vulnerabilities and exploits were involved?  What level of social engineering was required if any?  What assumptions did project leads (assuming they are honest actors) make that contributed to this outcome? If a proper security evaluation were present before these breaches, how would it have prevented them?"

...and others.  Of course, to answer the main question, as well as most of the sub-questions, there are further particular questions that must be answered through (2) and (3).  I mean questions like: "What is the underlying crypto, and what constitutes a sound implementation of it?" "What do users need to know to use blockchain tech?" "What constitutes a security breach?"

Notice, as these questions "decompose" to "smaller" questions, the large, complicated natures of computer science, human psychology and sociology seem to beckon the subquestions further into grand, speculative topics like "what is security?"  Such is the difficulty of thinking rigorously about new topics.

Anyway, thankfully we only need to do (1) "to satisfaction," which just means "enough to get started on research."  I have a good idea of the question I'm answering, and there's more than enough material in front of me to do so (AKA (2) and (3)).  The current plan is:

Re: (2) - A deep dive into the Bitcoin and Ethereum protocols, along with some further digging into Leslie Lamport et al's work in the 70s and 80s on distributed systems and consensus problems.  Not so interested in the road to bitcoin (bMoney, Hashcash, et al), but those are worth glancing at just to see the problems they wished to solve and difficulties they had, to consider if any of that bears on current security concerns.  For the deep dive, a thorough re-read of Mastering Bitcoin, a first read of Bitcoin and Cryptocurrency Technologies, along with further crypto reading from articles suggested by Prof. Ahmad and Paar's textbook and videos (I've studied cryptography in the past, but it was never my main focus).

Re: (3) - Proposals for improvements on the Bitcoin blockchain, and new cryptocurrency/blockchain-based tech.  The idea isn't really to evaluate them (a thesis worthy topic in itself: Proof-of-Stake vs Proof-of-Work?  How can Bitcoin scale (or "Can Bitcoin scale?")?), but rather to see what problems they are trying to solve and relate that to security.  

As an example of (3), today I have been reading [the Chainweb whitepaper](http://kadena.io/docs/chainweb-v15.pdf), a proposed tech from [Kadena](http://kadena.io) that claims to increase blockchain throughput.  On the first page, there's a [link to a good description](https://cointelegraph.com/explained/bitcoin-scaling-problem-explained) of the current debate regarding blockchain scaling.  Does this bear directly on security?  Well, actually, yes.  The security model I'm working with is one such that we want to consider confidentiality, availability, integrity, and non-repudiation.  Kadena (like all projects of this kind that aren't simply [ICO](https://www.investopedia.com/terms/i/initial-coin-offering-ico.asp) pyramid schemes) addresses several of these concepts directly.  In the [enterprise section](http://kadena.io/#/enterprise) they discuss and have further links to considerations about secrecy on chain.  Also, the fundamental concept, a massive parallel web of blockchains, immediately evokes strong concerns about integrity and availability.

Notably, despite the large paragraph in this blog and couple hours of my Sunday dedicated to Kadena, their work likely won't be discussed or even cited in my paper.  The point is to dig through as much of these as possible, so that my answer to the question regarding blockchain security is as relevant to actual blockchain use as it can be.  Also, it's never fun to make an academic argument and then read it refuted in a paper someone's already published and you could have read.

Along with proposals about new tech or blockchain upgrades like segwit, I'm also trying to read as many published exploits as I can.  Articles like [this one about predicting random numbers in Ethereum smart contracts](https://blog.positive.com/predicting-random-numbers-in-ethereum-smart-contracts-e5358c6b8620) illustrate specific (alleged) vulnerabilities, which can help focus my own work.  When I frame (3) as "moving backward toward (2)" (which is itself "moving forward toward (2)"), I mean that I intend to continue reading these present exploits, proposals, and commentary, but following them back to things like [the DAO](https://www.coindesk.com/understanding-dao-hack-journalists/) and [Mt. Gox](https://en.wikipedia.org/wiki/Mtgox) incidents.  It's unclear how much of my actual thesis will discuss large breaches, but neglecting to treat them at all would, in my opinion, risk invalidating any paper on blockchain security. 

I'll leave further discussion of (2) to another entry, which I'll try to align with CSCI 385.

Evan
