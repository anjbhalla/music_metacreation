# Welcome to Sonic Pi v3.1

speed = 0.75
pitch = 36
use_synth :fm
13.times do
  speed = speed * 0.8
  rel = 5*speed
  play pitch, release: rel
  4.times do
    sample :bd_haus
    sleep speed
  end
end
sample :bass_drop_c
sleep sample_duration(:bass_drop_c) - 0.2
2.times do
  sample :bass_thick_c, finish: 0.8
  12.times do
    use_synth :dsaw
    use_random_seed 3
    notes = (scale :e3, :minor_pentatonic).shuffle
    play notes.tick, release: 0.25, cutoff: 80
    sleep 0.25
  end
end
2.times do
  sample :bass_thick_c, finish: 0.8
  12.times do
    use_synth :dsaw
    use_random_seed 3
    notes = (scale :d3, :minor_pentatonic).shuffle
    play notes.tick, release: 0.25, cutoff: 80
    sleep 0.25
  end
end
sample :bass_thick_c, rate: 0.8, finish: 0.6
12.times do
  use_synth :dsaw
  use_random_seed 3
  notes = (scale :d3, :minor_pentatonic).shuffle
  play notes.tick, release: 0.25, cutoff: 80
  sleep 0.25
end
s = 0.25
index = 1
sample :bass_thick_c, rate: 0.72
12.times do
  s = s * 1.1
  use_synth :dsaw
  use_random_seed 3
  notes = (scale :d2, :minor_pentatonic).shuffle
  play notes.tick, release: 0.25, cutoff: 80
  if index < 12
    sleep s
  else
    sleep 0.75
  end
  index += 1
end
4.times do
  sample :bd_haus
  sleep 0.75
end
i = 95
c = 1
use_synth :tb303
loop do
  c = -1 if i == 120
  c = 1 if i == 90
  i = i + (0.5 * c)
  n = (ring :e1, :e2, :e3).tick
  play n, release: 0.125, cutoff: i, res: 0.8, wave: 0
  sleep 0.15
end
