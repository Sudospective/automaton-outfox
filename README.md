# Automaton v4.0.0 oITG / nITG template

### Note

- **This template currently does not work 😩**
  - Use of `loadfile` and `io.open` , which is broken in current version of NotITG
  - I usually resolve this by building my own bundler, packing every script files into one

### What is Automaton?

Automaton is an "animation engine".
It will help you animate mods and stuff.

It's originally made for JavaScript because I often do web graphics stuff.
But I made a lua binding of automaton (`automaton-lua`, `fg/libs/automaton.lua`)
so you can use Automaton even in NotITG!

### How to edit animations

First, grab the GUI client of Automaton (`automaton-electron`) from the URL below:

https://github.com/FMS-Cat/automaton-electron/releases

Once you get the client, open `fg/automaton.json` with the client.
Now you should see 5 rows of animation channels. Yes, you can edit them and apply to the file!

### How to use animations

Basically, see the `fg/default.xml`.

You are going to use a function called `auto` to use your animations,
so search this source code with the query "auto(" might help you maybe?

### Optional integration with automaton-electron

Using `automaton-notitg-glue`, you can sync the in-game time into the client.
It is not required but if you are familiar with node.js it might worth give it a shot.

See: https://github.com/FMS-Cat/automaton-notitg-glue

### Any question?

Yes, it isn't well documented.
If you have questions, you can ping me (@FMS_Cat) at UKSRT Discord!

https://uksrt.heysora.net/discord
