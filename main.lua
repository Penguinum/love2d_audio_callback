local love_audio_callback = require "love_audio_callback"

local sample_rate = 44100
local buffer_size = 4096
local bit_depth = 16
local nchannels = 2
local volume = 100

function love.load()
  love_audio_callback.init(sample_rate, buffer_size, bit_depth, nchannels)
end

function love.update(dt)
  love_audio_callback.update()
end

function love.draw()
  love.graphics.print("Volume: " .. volume)
end

function love.keypressed(k)
  if k == "up" then
    volume = volume + 10
  elseif k == "down" then
    volume = volume - 10
  end
  volume = math.max(math.min(100, volume), 0)
end

function love.fill_audio_buffer(buffer, nsamples, nchannels)
  for i = 1, nsamples do
    buffer:setSample(i - 1, 1, math.random(-100, 100)/100 * volume / 100)
    buffer:setSample(i - 1, 2, math.random(-100, 100)/100 * volume / 100)
  end
end
