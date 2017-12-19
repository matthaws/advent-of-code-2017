def spinlock
  count = 0
  idx = 0
  buffer = [0]
  steps = 348

  until count == 50000000
    count += 1
    idx = 348 % buffer.length + idx
    idx = idx % buffer.length if idx > buffer.length
    front = buffer[0..idx] || []
    back = buffer[idx+1..-1] || []
    buffer = front + [count] + back
    idx += 1
  end

  # buffer[buffer.index(2017) + 1]
  buffer[buffer.index(0) + 1]
end

p spinlock
