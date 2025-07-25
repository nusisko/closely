# Screen-OCR for Linux


A simple, robust script that brings Capture2Text-like functionality to your Linux desktop. Quickly capture any part of your screen, perform Optical Character Recognition (OCR), and automatically copy the extracted text to your clipboard.

## ✨ Features

* **Select & Capture:** Use your mouse to select any rectangular area on your screen.
* **Accurate OCR:** Leverages the powerful Tesseract engine for text recognition.
* **Auto-Clipboard:** Extracted text is instantly copied to your clipboard.
* **Desktop Notifications:** Get immediate feedback when the text has been captured successfully.
* **Easy Setup:** Works on most Linux desktop environments (GNOME, MATE, XFCE, etc.) with minimal setup.

## ⚙️ Installation

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/nusisko/closely](https://github.com/nusisko/closely)
    cd closely
    ```

2.  **Install Dependencies**
    This script relies on a few common command-line tools. You can install them all with a single command:
    ```bash
    sudo apt update && sudo apt install tesseract-ocr scrot imagemagick xsel libnotify-bin
    ```

3.  **Make the Script Executable**
    You need to give the script permission to run:
    ```bash
    chmod +x screen-ocr.sh
    ```

## 🚀 Usage

The best way to use this tool is to assign it to a custom keyboard shortcut.

1.  Open your system's **Keyboard Shortcuts** settings panel.
2.  Create a **new custom shortcut**.
3.  Set the **Name** to `Screen OCR` or similar.
4.  Set the **Command** to the **full path** of the `screen-ocr.sh` script. For example:
    ```
    /home/your_username/path/to/Screen-OCR-for-Linux/screen-ocr.sh
    ```
5.  Assign your desired **Shortcut** (e.g., `Ctrl+Alt+C` or `Super+Q`).

Now, whenever you press your key combination, your cursor will turn into a crosshair, ready to capture text!

## ⚠️ Troubleshooting

* **Shortcut doesn't work:**
    * Ensure you used the **full, absolute path** to the script in the command field.
    * The `Super` (`Win`) key can conflict with system shortcuts. Try a different combination like `Ctrl+Alt+C` first to confirm the script works.
* **"No such file or directory" error:**
    This means a dependency is missing. Run the installation command from Step 2 again.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.