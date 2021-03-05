import numpy as np

# data = np.int32()
# data = 0b01111111111111111000000000000000
# left = np.int16((data >> 16) & 0xffff)
# right = np.int16(data & 0xffff)

# outdata = np.ndarray((1,2),np.int16)
# outdata[:] = left, right
# print(outdata)

# print((left))
# print((right))
data = [0x01,0x00,0x00,0x00,0x00]
print(bin(data[0]))