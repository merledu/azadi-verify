Testing azadi (in C and assembly both) 

|      Tests     |  Passed/Failed   |      Ports     |  Expected output   |  Actual output   |
|----------------|------------------|----------------|--------------------|------------------|
| multiply       |     Passed       |      gpio_o    |      0x04H         |     0x04H        |
| add            |     Passed       |      gpio_o    |      0x0CH         |     0x0CH        |   
| addi           |     Passed       |      gpio_o    |      0x06H         |     0x06H        |
| sub            |     Passed       |      gpio_o    |      0x0AH         |     0x0AH        |
| Discriminant   |     Failed       |      gpio_o    | 0x02H(two solution)|        --        |
| Fibonacci      |     Failed       |      gpio_o    |  Fibonacci series  |        --        |
| Branch         |     Passed       |      gpio_o    |       0x0DH        |     0x0DH        |
| slt            |     Passed       |      gpio_o    |        0x0         |      0x0         |
| slti           |     Passed       |      gpio_o    |                    |                  |
| slli           |     Passed       |      gpio_o    |                    |                  |