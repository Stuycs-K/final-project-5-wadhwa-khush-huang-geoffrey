[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

THIS DOCUMENT IS REQUIRED
## Group Info

Members: Geoffrey Huang, Khush Wadhwa
Group Name: Double Exposure
## Overview

For our final project, we decided to code a basic photo editor/image processor. We implemented the LazyGUI so that we would have access to sliders and buttons that we would code to modify images. The GUI also gave us buttons that would allow for the importing and exporting images. We have three sliders that adjust the image properties. The exposure slider edits the brightness of the image, and it works by either increasing or decreasing the RGB values of each pixel in the image by the corresponding slider value. The contrast slider increases the visible difference between pixels, and it works by multiplying each image RGB value by the slider value. This ensures that the colors are able to stand out from each other. The saturation slider affects the vividness of the colors in an image, and it works by increasing the difference between the highest RGB value (either red, green or blue) and the lowest RGB value (also either red, green, or blue). Two other features of our project are monochrome and paintbrush. Monochrome is a mode that changes the image to greyscale form (colors will either be black, white, or grey). It works by setting the color of a pixel equal to the average of its RGB values, allowing for the conversion to a greyscale color. For the paintbrush, we made a separate class that defined its methods and functionalities. We used the LazyGUI in order to activate and use the paintbrush. Using LazyGUI, we implemented a toggle that would turn the brush on and off for use and a color mixer that would allow users to alter the color of the brush. Finally, we implemented methods of resetting and saving changes to the image.  
## Instructions

REQUIRED LIBRARY: LazyGui

1. Open the code in Processing and click the Import button to open a file in the photo editor. The photo will then be displayed in the center of the screen.
- Note that regardless of the image size, the image will be resized to be within the screen boundaries.
- Note that the image will display at the screen's approximate center (slightly to the right due to the sidebar).
- Note that Import will reprompt you to select a valid image file if you select a file with an invalid PImage extension.
2. Mess around with some of the sliders! Raise/lower the exposure, contrast, and switch the image from monochrome to not. Update the image save once you're finished.
- Note that the Contrast slider functions differently from the other sliders. It is a multiplier, restricted between a base value of 1 and a max value of 5. The other sliders range from -100 to 100 with 0 being a base value.
- Ensure that the PaintBrush toggle on the GUI is off. Otherwise, you may begin to paint on the image when you attempt to drag the slider. This is a LazyGui thing. We recommend that you type numbers into the GUI rather than dragging.
- After you Update Save, note that all sliders will be reset to 0. Your Save becomes the new base image atop which you can edit. 
3. Turn on the toggle for PaintBrush. Open the brush color menu to change the brush color. Drag on the image to draw.
- The PaintBrush only applies paint when you drag/click on the image. It will not apply paint outside of the image.
- The paint color can be affected by the sliders. If you apply slider filters, the paint color will not match the color you have selected. For this reason, we recommend you paint after applying slider-based filters. Update Save before this step.
- The PaintBrush repetitively applies squares of size "Brush Size" to the image. You may alter brush size to your liking. 
- The speed at which you drag your mouse affects where the paint squares will appear. If you drag too quickly, it will not look like paint. Drag slowly for best results.
4. Before you Update Save after using the PaintBrush, press the Restore Save button to restore your last save. 
- You may also apply additional filters before this step. This function will undo all filters/paint since the last save.
5. Add some more paint, Update Save, and press Export to resolve your image to a file.
- Export works on the last save of your image. If you do not save your image before exporting, it will refer to the most recent save and will not include your changes since that save.
- You can export multiple times! The exported files will be located in the Sketch folder and will be named "image[export number].png". Export, make some changes, save, and export again to see this in action.
- So long as an image is on screen, export will ALWAYS create a file in the Sketch folder as an export. It will not provide a confirmation message.

## Presentation Link


## Major Bugs + Workarounds

1. As mentioned in the instructions, the PaintBrush color will be affected by any filters that you are applying to the image since the most recent save file. Therefore, to use the exact color you have picked in the ColorPicker, we recommend that you apply filters first, Update Save, and then use the PaintBrush. 
2. LazyGui has a really annoying tendancy to pre-load old values. When you load up the Sketch, please press 'R' to reset the values on the GUI.