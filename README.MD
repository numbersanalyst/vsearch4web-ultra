# Vsearch4Web ULTRA

It's an improved and professional version of the [vsearch4web](https://github.com/numbersanalyst/head-first-python) application. Allows you to search for letters in a given phrase. Additionally, you can see amouth of found letters. You can also search with case sensitive or not. The aplication uses Python, Flask, SQL, MariaDB, Flowbite, Tailwind.

## Features
The application have many technical features, for example:
* custom exceptions with messages
* own db context manager
* independently working logging system

## Entry page /
![entry page](github/entry_page.png)

## Result page /search4
![result page](github/result_page.png)

## View log page /viewlog
![view page](github/view_page.png)

## Login page /login and /logout
There is also a login page and a logout page. That is giving you access to the view log page.

## How to run locally
Open the project and type:
```
py main.py
```

## Requiments
Please install the following packages:
* flask
* mysql.connector

And make sure you have imported the database from the database.sql file. With data the same as in the application configuration. If you have MariaDB or maybe MySQL installed, you can do this by typing:
```
mysql --user=vsearch --password=vsearchpasswd --database=vsearchlogDB < database.sql
```