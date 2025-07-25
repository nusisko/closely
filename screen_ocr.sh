#!/bin/bash

# A robust script to capture a screen area, OCR the text, and copy it to the clipboard.
#
# Dependencies: tesseract-ocr, imagemagick, scrot, xsel, libnotify-bin (for notifications)

# Ensure the notification tool is installed
if ! command -v /usr/bin/notify-send &> /dev/null; then
    echo "Notification tool not found. Please install libnotify-bin."
    echo "sudo apt-get install libnotify-bin"
    exit 1
fi

# Create a temporary file for the screenshot
# The trap command ensures the temp files are deleted when the script exits
TMP_FILE=$(mktemp)
trap 'rm -f "$TMP_FILE"*' EXIT

# 1. Capture a selected screen area.
# The -s flag is for selection. -q 100 sets max quality.
/usr/bin/scrot -s "$TMP_FILE.png" -q 100

# If the screenshot file wasn't created (e.g., user pressed Esc), exit.
if [ ! -f "$TMP_FILE.png" ]; then
    exit 0
fi

# 2. Process the image to improve OCR accuracy.
# -modulate 100,0 converts to grayscale. -resize 400% enlarges it.
/usr/bin/mogrify -modulate 100,0 -resize 400% "$TMP_FILE.png"

# 3. Run Tesseract OCR.
# -l eng explicitly sets the language to English. Output is written to TMP_FILE.txt.
/usr/bin/tesseract "$TMP_FILE.png" "$TMP_FILE" -l eng &> /dev/null
 
# 4. Copy the OCR'd text to the clipboard and send a notification.
# The -b option handles the primary and clipboard selections.
TEXT_OUTPUT=$(cat "$TMP_FILE.txt")
echo -n "$TEXT_OUTPUT" | /usr/bin/xsel -b
/usr/bin/notify-send "Text Captured" "$TEXT_OUTPUT"

exit 0
