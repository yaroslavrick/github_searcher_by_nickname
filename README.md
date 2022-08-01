# README

## Task

The main task is to make a form in Rails that search in github by username.
The result must be "full name" and list of user's repos.

### Example:

    user: dhh

Result:

    David Heinemeier Hansson
    - asset-hosting-with-minimum-ssl
    - conductor
    - textmate-rails-bundle

## Done:

- Searching by username in github.com, Task was to parse with GraphQL, but I make it with gem 'faraday'...

  Display search results:

* Name of author
* List of repositories

- Use GitHub flow (https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/github-flow#following-the-github-flow)

## Todo:

- Learn GraphQL and make a task with it (https://github.com/rmosolgo/graphql-ruby)
- RSpec-rails tests (https://github.com/rspec/rspec-rails)
- Learn vcr and make a task with it (https://github.com/vcr/vcr)
- Add linter jslint_on_rails (https://github.com/mackuba/jslint_on_rails)
- Add linter rubocop (https://github.com/rubocop/rubocop)

- Deploy app to heroku
