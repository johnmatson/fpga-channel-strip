import spidev
import time
import sounddevice as sd
import numpy as np

REQ_SAMPLE = [0x01,0x00,0x00,0x00,0x00]

spi = spidev.SpiDev()
spi.open(0,0)
spi.max_speed_hz = 31200000

def getSample(outdata, frames, time, status):
    #data = np.int32()
    data = spi.xfer2(REQ_SAMPLE)
    left_MS = np.int16(data[1])
    left_LS = np.int16(data[2])
    right_MS = np.int16(data[3])
    right_LS = np.int16(data[4])
    left = np.int16((left_MS << 8) | left_LS)
    right = np.int16((right_MS << 8) | right_LS)
    outdata[:] = left, right
    #print(data, outdata, REQ_SAMPLE)

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