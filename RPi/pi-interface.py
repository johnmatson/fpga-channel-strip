import spidev
import time
import sounddevice as sd
import numpy as np

REQ_SAMPLE = 0b00000001
NEW_SAMPLE = 0b00000010

spi = spidev.SpiDev()
spi.open(0,1)
spi.max_speed_hz(62.5e6)

def getSample(outdata, frames, time, status):
    data = np.int32()
    data = spi.xfer2(REQ_SAMPLE)
    left = np.int16((data >> 16) & 0xffff)
    right = np.int16(data & 0xffff)
    outdata[:] = left, right

stream = sd.OutputStream(
    samplerate=48e3,
    blocksize=1,
    channels=2,
    dtype=np.int16,
    callback=getSample)

try:
    stream.start()
    while True:
        pass
finally:
    stream.stop()