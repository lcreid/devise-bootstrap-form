# Contributing

If you find a bug or have an idea for a feature:

1. Search the issues to see if the bug has been found, or the feature has already been requested. If so, feel free to add your constructive input to the existing issue. Otherwise...
2. Create an issue describing the bug or feature. We welcome contributions from people like you, so if you want to submit a pull request for the bug or feature, say so in the description of the issue.
3. If you want to submit a pull request, we recommend you wait a few days until we respond to the issue. There is a small chance that we might feel that the feature isn't appropriate for this gem.
4. If you don't want to submit your own pull request, your issue is still welcome and we'll review it and respond appropriately.

## Testing

There are automated tests, and test apps that allow you do manual testing and explore the gem.

### Manual and Exploratory Testing

There are test apps in `test/rails_app`, for the default locale, and `es_rails_app` for a Spanish locale.

To use the `devise-bootstrap-form` gem in a test app:

```bash
cd test/rails_app # or cd test/es_rails_app
# Generate the view in the test app
rails g devise:views:bootstrap_form
bin/dev
# Navigate to localhost:3000/people/sign_in
```

To change the version of Rails for the test app:

```bash
export BUNDLE_GEMFILE=gemfiles/7.0.gemfile # change this to the version of Rails you need
bundle update
bin/dev
```

### Automated Testing

To test locally against a specific version of Rails, do the following:

```bash
export BUNDLE_GEMFILE=gemfiles/7.0.gemfile # change this to the version of Rails you need
bundle update
rake test
```

To run the tests and the RuboCop checks, assuming you've set the `BUNDLE_GEMFILE` as above:

```bash
rake
```

## New Version of Rails

I create a new app from scratch in a new directory.

1. Install latest Rails: `gem install rails`.
1. Create a new app: `cd test && rails new rails_app_8.0 --skip-git --javascript=esbuild --css bootstrap`.
1. `cd rails_app_8.0`.
1. `rails db:prepare`.
1. Update the `web` line of `Procfile.dov` to: `web: env RUBY_DEBUG_OPEN=true bin/rails server -b 0.0.0.0`.
1. `bin/dev`.
1. Follow the standard installation instructions from the [README](), but get the `devise-bootstrap-form` gem from the parent directory.
    ```
    gem "devise-bootstrap-form", path: "../.."
    ```
1. Follow the instructions in the [above section](#manual-and-exploratory-testing).
1. Restart the server.

## Gotchas

To test that the views work for a model other than the default `User`, the test apps use `Person` as the Devise model. It's a bit frustrating to remember that you can't just cut and paste examples that assume the model is `User`.

## Coding Guidelines

This project uses [RuboCop](https://github.com/bbatsov/rubocop) to enforce standard Ruby coding
guidelines. The coding standards are close to the out-of-the-box RuboCop standards. The main differences are:

* We prefer double-quoted strings.
* We allow 132 characters per line.
* We don't lint most of the Rails-generated files in the test application.

Note the GitHub actions build will fail and your PR cannot be merged if the linter finds errors.

* Test that your contributions pass with `rake lint`.
* The linter is also run as part of the default rake task `rake`.
