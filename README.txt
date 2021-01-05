#Robot Framework Optimy Setup and Pre-requisites

1. Install Python on your computer - https://www.python.org/downloads/
    - To check if Python is installed by typing `python --version` in cmd
    - Also check for the pip version by typing `pip --version`
2. In the cmd, install robotframework by typing `pip install robotframework`
    - To check if robotframework is installed by typing `robot--version` in cmd
3. In the cmd, install selenium libraries by typing `pip install robotframework-selenium2library`
    - To check if robotframework is installed by typing `pip list` in cmd
    - You should see the `robotframework-selenium2library` in the list
4. Download chromedriver,geckodriver and IEDriverServer and make sure to save the application file inside the executable path of Python
    - chromedriver = https://chromedriver.chromium.org/downloads
    - geckodriver = https://github.com/mozilla/geckodriver/releases
    - iedriver = https://www.selenium.dev/downloads/
    - These drivers will allow you to run your automated tests in Chrome,Firefox and IE 11
5. Install vscode for development of test script (this is just my personal choice there are many IDEs for code developments e.g Pycharm and Eclipse)

How to run robot scripts:
1. Go to the directory where you installed your test scripts (.robot files)
2. Type this in the terminal robot "your test script name".robot

Notes:
*1. IE11 is really unstable for automation tests. There are many articles supporting this in the web.*
*2. Tests are unreliable when running in IE11 because they are so flaky. Due to several factors like the driver comapatibility issue and server issues.*
