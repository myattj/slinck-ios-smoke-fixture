# About this repository

This is the public sample app Slinck uses to demonstrate remote iOS builds on a
managed Mac. It is a plain SwiftUI app with no dependencies, no credentials, and
no network access, so a governed session can build and run it while granting
nothing.

`SlinckSmokeSample/ContentView.swift` is the whole screen: a green checkmark, a
title, a subtitle, and a `Confirm` button that flips the subtitle to
"Confirmed by agent". The accessibility identifiers `smoke.title`,
`smoke.subtitle`, and `smoke.confirm` are load-bearing — a remote agent finds
the button by `smoke.confirm`, taps it, and re-reads the subtitle to prove it
drove the running app rather than only photographing it. Keep them if you change
the layout.

## Working on it

Slinck builds an exact pushed commit; it does not sync your working tree. Commit
and push a change before asking a remote session to build it, and pass that full
SHA. A build of an unpushed commit will not contain your edit.

That is the only repository-specific thing worth knowing. How to drive the
Slinck tools is documented by the tools themselves: read their descriptions and
input schemas, which are always current for the deployment you are talking to,
and act on the errors they return. Notes pinned in a file like this one go stale
against a live service — an earlier version of this document told agents that
`inspect` was unavailable and that they must not tap anything, both of which
were wrong by the time anyone read them.
