# (Unofficial) OpenAI API Quickstart - Ruby example app

This is an example pet name generator app used in the OpenAI API [quickstart tutorial](https://beta.openai.com/docs/quickstart). It uses the [Sinatra](http://sinatrarb.com/) web framework. Check out the tutorial or follow the instructions below to get set up.

## Setup

1. If you don’t have Ruby installed, I recommend [install it with rbenv](https://github.com/rbenv/rbenv)

2. Clone this repository

3. Navigate into the project directory

   ```bash
   $ cd openai-quickstart-ruby
   ```

4. Install the `bundler` gem

   ```bash
   $ gem install bundler
   ```

5. Install the requirements

   ```bash
   $ bundle install
   ```

6. Make a copy of the example environment variables file

   ```bash
   $ cp .env.example .env
   ```

7. Add your [API key](https://beta.openai.com/account/api-keys) to the newly created `.env` file

8. Run the app

   ```bash
   $ ruby app.rb
   ```

You should now be able to access the app at [http://localhost:4567](http://localhost:4567)! For the full context behind this example app, check out the [tutorial](https://beta.openai.com/docs/quickstart).
