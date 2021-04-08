Testing azadi (in C and assembly both) 

|      Tests     |  Passed/Failed   |      Ports     |  Expected output   |  Actual output   |
|----------------|------------------|----------------|--------------------|------------------|
| multiply       |     Passed       |      gpio_o    |      0x04H         |     0x04H        |
| add            |     Passed       |      gpio_o    |      0x0CH         |     0x0CH        |   
| addi           |     Passed       |      gpio_o    |      0x06H         |     0x06H        |
| sub            |     Passed       |      gpio_o    |      0x0AH         |     0x0AH        |
| Discriminant   |     Failed       |      gpio_o    |                    |                  |
| Fibonacci      |     Failed       |      gpio_o    |                    |                  |
| Branch         |     Passed       |      gpio_o    |                    |                  |
| slt            |     Passed       |      gpio_o    |                    |                  |
| slti           |     Passed       |      gpio_o    |                    |                  |
| slli           |     Passed       |      gpio_o    |                    |                  |