
# Twitcher

> This app allows users to sign in/signup,follow/unfollow other users, share his/her opinions with them.
  
## Project features

- Create an account
- Add a profile and cover image
- Follow users
- Unfollow users
- Publish opinions
- Read other user's posts
 

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.3.4

## Live vesion
[click here](https://ltwitcher.herokuapp.com/users/sign_in)

## Screenshot
![screenshot1](app/assets/images/screenshot.png)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.0

Rails: 6.0.3.4

Postgres: >=9.5

[Chromdriver](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver)

### Clone the Project

```
$ git clone https://github.com/UmairAhmad125/twitter-redesign.git

$ cd twitter-redesign
```

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


# Testing

To run the testing, you need to have ChromeDriver installed in your environment.
Run one of this commands respected to your system:

```
Mac users with Homebrew installed: brew tap homebrew/cask && brew cask install chromedriver
Debian based Linux distros: sudo apt-get install chromium-chromedriver
Windows users with Chocolatey installed: choco install chromedriver

```


Now you can run the testing using this command:

```
rspec

```

## Developer

👤 **Umair Ahmad**
- Github: [@umairahmad125](https://github.com/UmairAhmad125)
- Linkedin: https://www.linkedin.com/in/umair-ahmad-b5a89015a/
- Twitter: [@umairahmadDP](https://twitter.com/umairahmadDP)
- email: (umairahmad125@gmail.com)


## 🤝 Contributing


Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
 
- <a href="https://www.theodinproject.com/" target="_blank">The Odin Project</a>
- <a href="https://guides.rubyonrails.org/" target="_blank">Rails Guides</a>
