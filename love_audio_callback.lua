local source, buffers
local buffers_count = 2
local buffer_cursor = 1
local buffer_size, channels_number

local function init(sample_rate, buf_size, bit_depth, _nchannels)
  buffer_size = buf_size
  channels_number = _nchannels
  source = love.audio.newQueueableSource(sample_rate, bit_depth, channels_number, buffers_count)
  buffers = {}
  for i = 1, buffers_count do
    buffers[i] = love.sound.newSoundData(buffer_size, sample_rate, bit_depth, channels_number)
  end
end

local function update()
  if not source:isPlaying() then
    source:play()
  end
  if source:getFreeBufferCount() > 0 then
    local buffer = buffers[buffer_cursor]
    buffer_cursor = buffer_cursor % buffers_count + 1

    -- clear buffer
    for sample = 0, buffer_size - 1 do
      for channel = 1, channels_number do
        buffer:setSample(sample, channel, 0)
      end
    end

    love.fill_audio_buffer(buffer, buffer_size, channels_number)
    source:queue(buffer)
  end
end

return {
  init = init,
  update = update,
}
