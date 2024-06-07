# Work Log

## Khush Wadhwa

### 05/22/2024

Initialized directories and created base Java/Processing files. Designed the fields, constructors, and methods for the Button class. Added Button icons to the data folder. Created basic setup() method and added all relevant fields to the PhotoEditor (main) class.

### 05/23/2024

Worked on applying toggles from the LazyGUI package and searched for mathematical applications of different Kernels (beginning with the Gaussian blur).


### 05/24/2024 -> 05/27/2024

Finalized GUI looks for Stage 1, designed calcImageCoords() to center image when displaying it. Beginning to research how to apply different filters/settings to images for Stage 2 Development. 

### 05/28/2024

Worked on redesigning Kernel approach in-class, researched other ways of doing pixel manipulation at home. 

### 05/29/2024

Continued to work on import functionality and implemented ControlP5 text input.

### 05/30/2024

Finalized implementation of import(), pending error message for incorrect filenames. 

### 06/01/2024

Worked more on redesigning import() to use Processing file handling. Deleted old redundant code.

### 06/02/2024

Designing PaintBrush class.

### 06/04/2024

Continued creating basic design elements of Paintbrush.

### 06/06/2024

Struggling to applyPaint() to images. Basic design elements incorporated and the method works, but image is not displaying properly.

## Geoffrey Huang

### 05/22/2024

Created the kernel class and modified the code from the previous kernel lab.

### 05/23/2024

Began researching the LazyGUI to implement into our code.

### 05/24/2024 -> 05/27/2024

Experimented with the LazyGUI sliders. Managed to get the sliders to affect the color/brightness settings of imported photos. Realized that kernels will be harder to implement.

### 05/28/2024

Experimented with color values on branc1, will need to modify methods to adjust exposure. Use of kernels did not work as expected.

Notes:
- Brightness increases by increasing the rgb values in equal proportion
- Saturation increases by increasing the two highest rgb values
- Contrast increase by multiplying each rgb value by the slider value

### 05/29/2024-06/01/2024

Moved the image modification code onto another branch. Ran into numerous problems, so spent these few days debugging

### 06/02/2024-06/03/2024

Worked on the import method

### 06/04/2024-06/05/2024

Worked on the monochrome function
