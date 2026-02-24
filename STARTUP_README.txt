========================================================================
                    FIRESENSE AUTO-RUN FILES
========================================================================

You have 3 batch files to choose from:

========================================================================
1. START_FIRESENSE.bat (Recommended)
========================================================================
   - Full version with checks
   - Verifies Python is installed
   - Checks if packages are installed
   - Shows nice ASCII logo
   - Best for regular use

   HOW TO USE:
   Double-click START_FIRESENSE.bat

========================================================================
2. START_FIRESENSE_SIMPLE.bat (Quick Start)
========================================================================
   - Simple version
   - Just runs Python app.py
   - No checks, just starts
   - Best for quick testing

   HOW TO USE:
   Double-click START_FIRESENSE_SIMPLE.bat

========================================================================
3. INSTALL_AND_RUN.bat (First Time Setup)
========================================================================
   - Installation wizard
   - Installs all required packages
   - Step-by-step setup
   - Best for first-time setup

   HOW TO USE:
   Double-click INSTALL_AND_RUN.bat

========================================================================
                    RECOMMENDED WORKFLOW
========================================================================

FIRST TIME:
1. Run INSTALL_AND_RUN.bat
2. Follow the setup wizard
3. Wait for packages to install

DAILY USE:
1. Just double-click START_FIRESENSE.bat
2. Wait for server to start
3. Open browser to http://localhost:5000
4. Login: admin / admin123

========================================================================
                    STOPPING THE SERVER
========================================================================

In the command window, press: CTRL + C
Then close the window

========================================================================
                    TROUBLESHOOTING
========================================================================

Problem: "Python is not recognized"
Solution: Install Python from https://www.python.org/
         Make sure to check "Add Python to PATH" during installation

Problem: "Flask not found"
Solution: Run INSTALL_AND_RUN.bat to install packages

Problem: "MySQL connection error"
Solution: 1. Start XAMPP
         2. Start MySQL service
         3. Import firesense_hotel.sql database

Problem: Port 5000 already in use
Solution: 1. Close other Flask apps
         2. Or edit app.py and change port to 5001

========================================================================
                    AUTO-START ON WINDOWS BOOT
========================================================================

To make FireSense start automatically when Windows starts:

1. Press Win + R
2. Type: shell:startup
3. Press Enter
4. Copy START_FIRESENSE.bat to this folder
5. Restart Windows to test

========================================================================
                    CREATING DESKTOP SHORTCUT
========================================================================

1. Right-click on START_FIRESENSE.bat
2. Click "Send to" > "Desktop (create shortcut)"
3. Rename shortcut to "FireSense"
4. Right-click shortcut > Properties
5. Click "Change Icon" to set custom icon
6. Click OK

========================================================================
