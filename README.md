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
**Note: LazyGui has a really annoying tendancy to pre-load old values. When you load up the Sketch, please press 'R' to reset the values on the GUI.**

1. Open the code in Processing and click the Import button to open a file in the photo editor. The photo will then be displayed in the center of the screen.
- Note that regardless of the image size, the image will be resized to be within the screen boundaries.
- Note that the image will display at the screen's approximate center (slightly to the right due to the sidebar).
- Note that Import will reprompt you to select a valid image file if you select a file with an invalid PImage extension.
2. Mess around with some of the sliders! Raise/lower the exposure, contrast, and switch the image from monochrome to not. Update the image save once you're finished.
- Note that the Contrast slider functions differently from the other sliders. It is a multiplier, restricted between a base value of 1 and a max value of 5. The other sliders range from -100 to 100 with 0 being a base value.
- Ensure that the PaintBrush toggle on the GUI is off. Otherwise, you may begin to paint on the image when you attempt to drag the slider. This is a LazyGui thing. You can also type numbers into the GUI rather than dragging.
- After you Update Save, note that all sliders will be reset to 0. Your Save becomes the new base image atop which you can edit. 

