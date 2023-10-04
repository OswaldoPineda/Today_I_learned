# Today I learned
TIL-Dev is a user-friendly mobile application designed exclusively for capturing and sharing daily "Today I Learned" (TIL) moments. With a seamless and intuitive interface, users can easily jot down interesting facts, insights, or new knowledge they acquire throughout the day. The app focuses on enhancing learning experiences and fostering a community of curious minds.|

<hr />

### How to Create a TIL (Today I Learned) Post:
- Create a new account to access our platform.
- Click on the new post button in the navigation bar.
- In this section, fill out three fields:
  - Title: We recommend creating a title that is completely descriptive, enabling anyone to understand the topic you've learned about instantly. 🔥
  - Description: This field supports Markdown, allowing you to add a detailed description of your learning topic. 💬
  - Label: Labels are required to categorize the post effectively. 🏷️

- Finally publish the TIL and enjoy share your knowledge with our community. 🚀
<hr />

### How to create an issue to report a bug.
- Create ticket accesing of our [github issues dashboard](https://github.com/OswaldoPineda/Today_I_learned/issues).
- Use our [issue template](ISSUE_TEMPLATE.md)
<hr />

### Setup the Project
- Do a git clone of this [repositorie](https://github.com/OswaldoPineda/Today_I_learned)
- Set this versions on local:
  - ruby version:
    - `brew install rbenv ruby-build`
    - `rbenv install 3.0.6`
    - `rbenv global 3.0.6`
    - `which ruby` and `ruby -v` to verify correctly the installation.

  - Bundler
    - `gem install bundler`

  - Postgres
    - Install postgresql and start the server:

      ```
        # install postgres
        brew install postgresql

        # start postgres
        brew services start postgresql
      ```

  - Node version

      Make sure you have the right version of Node.js

      First install [NVM](https://github.com/nvm-sh/nvm#installing-and-updating) and then:

      `nvm install 18.15.0`

      `nvm use 18.15.0`

  - Install the app
    - Dependencies are installed using `bundle && yarn`
    - Database setup is accomplished with `rails db:setup`

  - Run the server
    -   `rails s`

  - Test Suite
    - Rspec is configured, you can run the them with `bundle exec rspec`

<hr />

### How to create a Pull Request

- All our infresturce to create pull request is over branches please following this steps:
  - create a new branch:
    - `git checkout -b feature/<'something-cool-feature-description'>`
  - create a commit (and is important pass in green all our linterns):
    - `git commit`
    - And following this [instructions](COMMIT_TEMPLATE.md) to fill your commit with the best practices.
  - Push our branch to github:
    - `git push origin  feature/<'something-cool-feature-description'>`
  - Fill the pull request template with the organization structure.
  - reques a review to [Oswaldo Pineda](https://github.com/OswaldoPineda) or [Juanequex](https://github.com/juanequex).

<hr/>

### Visit our page
- Visit the [page here](http://today-i-learned-app-production.herokuapp.com/).
