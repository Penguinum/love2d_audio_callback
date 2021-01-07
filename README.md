# What is this
A tiny library for [love2d](https://love2d.org/) framework to help setup audio callback (a.k.a. "fill audio buffer of fixed size when needed"). This can be useful if you have Lua-controlled stream of samples that you need to send to playback. Think of generating music on-fly or plugging in some audio engine like SunVox (which is why I made this).
# Usage
See example file (main.lua). It's pretty simple: init library variables with `love_audio_callback.init`, register callback `love.fill_audio_buffer` and call `love_audio_callback.update` in `love.update`.
# Requirements
love2d 11.0+ (for queueable source)
# License
The Unlicense (see UNLICENSE.txt)