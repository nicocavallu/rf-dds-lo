# gen_sine_table.py 
''' 
Pyhon script to generate a sine wave for the LUT table 
'''

import numpy as np

n = 1024 # (2^10)

amp = 131071 # (2^17 - 1)

step = 2.0 * np.pi / n  

with open("sine_table.mem", "w") as f:
    for i in range(n):
        angle = i * step 
        val = 0
        raw_val = int(round(amp * np.sin(angle)))

        if raw_val < 0:
            val = (1 << 18 ) + raw_val
        else:
            val = raw_val

        f.write(f"{val:05X}\n")

print("Succesfully generated sine_table.mem with 1024 18-bit values")
