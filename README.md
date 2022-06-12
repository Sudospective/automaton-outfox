# Automaton v4.0.0 oITG / nITG template
Original by 0b5vr, Ported to OutFox by Sudospective

### Note

- **This template currently does not work in nITG 😩**
  - Use of `RageFileUtil.CreateRageFile` is not present in oITG/nITG
  - I usually resolve this by downloading the original Automaton template, which has other issues
  - It's possible this template may not work in SM5 (untested)

### What is Automaton?

Automaton is an "animation engine".
It will help you animate mods and stuff.

It's originally made for JavaScript because I often do web graphics stuff.
But I made a lua binding of automaton (`automaton-lua`, `fg/libs/automaton.lua`)
so you can use Automaton even in NotITG or OutFox!

### How to edit animations

First, grab the GUI client of Automaton (`automaton-electron`) from the URL below:

https://github.com/FMS-Cat/automaton-electron/releases

Once you get the client, open `fg/mods.json` with the client.
Now you should see several rows of animation channels. Yes, you can edit them, add more, and apply to the file!

### How to use animations

Basically, see the `fg/default.xml`.

You are going to use a function called `auto` to use your animations,
so search this source code with the query "auto(" might help you maybe?

### Optional integration with automaton-electron (DOES NOT WORK WITH OUTFOX)

(This is left here for documentation purposes.)

Using `automaton-notitg-glue`, you can sync the in-game time into the client.
It is not required but if you are familiar with node.js it might worth give it a shot.

See: https://github.com/FMS-Cat/automaton-notitg-glue

### Any question?

Yes, it isn't well documented.
If you have questions, you can ping me (@Sudospective) on the OutFox server! (please let 0b5vr rest they are a good bean and did hard work おつかれさま)

[Here's an invite link.](https://discord.gg/cn9tSy672f)
