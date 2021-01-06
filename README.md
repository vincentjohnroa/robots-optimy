# Repository Setup
1. Install git on your computer - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

2. Login your github account or create a new one if you dont have any

3. Click `create repository`

4. Go to your cmd and type `git init`

5. Go to your cmd and do these:
    - Set your git username: `git config --global user.name "FIRST_NAME LAST_NAME"`
    - Set your git email address: `git config --global user.email "MY_NAME@example.com"`

6. Type this in the cmd `git remote add origin https://github.com/<repository name>.git`
    - This will allow you to add commits and push your changes to your repository

# Robot Framework Optimy Setup and Pre-requisites

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
2. Type this in the terminal `robot "your test script name".robot`

Notes:
1. *IE11 is really unstable for automation tests. There are many articles supporting this in the web.*
2. *Tests are unreliable when running in IE11 because they are so flaky. Due to several factors like the driver comapatibility issue and server issues.*
