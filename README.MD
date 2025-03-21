# 📚 ft_printf 125/100

Second project of the 42's Cursus.

ft_printf is a custom implementation of the standard C `printf` function. The aim of this project is to recreate the behavior of `printf` using only allowed functions, handling a variety of conversion specifiers. 
In the bonus part, additional flags, and formatting options are implemented to further enhance the output formatting.

---

## Features

### **Mandatory Part**

- **Conversion Specifiers:**
  - **%c:** Prints a single character.
  - **%s:** Prints a string (handles `NULL` pointers by printing `(null)`).
  - **%p:** Prints a pointer address in hexadecimal with a `0x` prefix.
  - **%d / %i:** Prints a signed decimal integer.
  - **%u:** Prints an unsigned decimal integer.
  - **%x / %X:** Prints an unsigned hexadecimal integer in lowercase (`%x`) or uppercase (`%X`).

### **Bonus Part**

- **Additional Formatting Options:**
  - **Flags:**
    - **'#':** For `%x`/`%X`, adds the `0x`/`0X` prefix when the value is non-zero.
    - **'0':** Pads the output with zeros instead of spaces.
    - **'-':** Left-aligns the result within the specified field width.
    - **' ' (space):** Inserts a leading space before positive numbers if no sign is present.
    - **'+':** Forces a plus sign for positive numbers.
  - **Width & Precision:**  
    Advanced handling of minimum field width and precision (for numbers and strings) is provided as part of the bonus. These features allow fine control over the output formatting, including padding and alignment adjustments.

---

## Installation & Compilation

To compile ft_printf, simply run:

```sh
make
```

This will compile the mandatory part of project.

Alternatively, run:

```sh
make bonus
```

To compile the complete project (Mandatory and Bonus).

### Cleaning Up

- `make clean` – Removes object files.
- `make fclean` – Removes object files and the final executable/library.
- `make re` – Fully recompiles the madatory part of the project.
- `make rebonus` – Fully recompiles the complete project (Mandatory and Bonus).

---

## Usage

Include the header file in your project:

```c
#include "ft_printf.h"
```

Compile your program with:

```sh
cc my_program.c -L. -lft_printf -o my_program
```

---

## Implementation Details

### **Conversion Specifiers**

- **%c**  
  Prints a single character.  
  ```c
  ft_printf("Character: %c\n", 'A');    // Expected output: "A"
  ```

- **%s**  
  Prints a string. Handles `NULL` by printing `(null)`.
  ```c
  ft_printf("String: %s\n", "Hello, world!");   // Expected output: "Hello, world!"
  ```

- **%p**  
  Prints a pointer address in hexadecimal format with a `0x` prefix.
  ```c
  ft_printf("Pointer: %p\n", ptr);  // Expected output: "0x00...."
  ```

- **%d / %i**  
  Prints a signed decimal integer, handling negative numbers appropriately.
  ```c
  ft_printf("Signed: %d\n", -42);   // Expected output: "-42"
  ```

- **%u**  
  Prints an unsigned decimal integer.
  ```c
  ft_printf("Unsigned: %u\n", 42);  // Expected output: "42"
  ```

- **%x / %X**  
  Prints an unsigned hexadecimal integer in lowercase (`%x`) or uppercase (`%X`).
  ```c
  ft_printf("Hex: %x\n", 255); // Expected output: "ff"
  ```

### Formatting Flags (Bonus)

- **'#' Flag:**  
  Prepends `0x` (or `0X` for uppercase) for non-zero hexadecimal numbers.
  ```c
  ft_printf("Hex with sharp: %#x\n", 255);       // Expected output: "Hex with sharp: 0xff"
  ft_printf("Hex with sharp (uppercase): %#X\n", 255); // Expected output: "Hex with sharp (uppercase): 0XFF"
  ```

- **'0' Flag:**  
  Pads the output with zeros up to the minimum field width.
  ```c
  ft_printf("Zero padded: %05d\n", 42);           // Expected output: "Zero padded: 00042"
  ft_printf("Zero padded hex: %08x\n", 42);        // Expected output: "Zero padded hex: 0000002a"
  ```

- **'-' Flag:**  
  Left-justifies the output within the specified field width.
  ```c
  ft_printf("Left-justified: %-5d!\n", 42);        // Expected output: "Left-justified: 42   !"
  ft_printf("Left-justified string: %-10s!\n", "Hi"); // Expected output: "Left-justified string: Hi        !"
  ```

- **' ' (Space) Flag:**  
  Inserts a leading space for positive numbers when no sign is printed.
  ```c
  ft_printf("Space flag: % d\n", 42);              // Expected output: "Space flag:  42"
  ft_printf("Space flag with negative: % d\n", -42); // Expected output: "Space flag with negative: -42"
  ```

- **'+' Flag:**  
  Forces a plus sign for positive numbers.
  ```c
  ft_printf("Plus flag: %+d\n", 42);               // Expected output: "Plus flag: +42"
  ft_printf("Plus flag with negative: %+d\n", -42);  // Expected output: "Plus flag with negative: -42"
  ```

- **Width & Precision:**  
  Control the minimum field width and the precision of numeric and string outputs.
  ```c
  // For numbers:
  ft_printf("Width (8d): %8d\n", 42);              // Expected output: "Width (8d):       42"
  ft_printf("Precision (5d): %.5d\n", 42);          // Expected output: "Precision (5d): 00042"
  ft_printf("Width and Precision: %8.5d\n", 42);     // Expected output: "Width and Precision:    00042"

  // For strings:
  ft_printf("String Precision: %.3s\n", "Hello");   // Expected output: "String Precision: Hel"
  ft_printf("Width and String Precision: %10.3s!\n", "Hello"); // Expected output: "Width and String Precision:        Hel!"
  ```

## License

This project is part of 42 School curriculum.
