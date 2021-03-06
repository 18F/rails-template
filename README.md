18F-Flavored Rails 7 Project
============================

This template will create a new Rails 7.0.x project.

See the `rails-6` branch for Rails 6.1.x

## Use for new Rails Project

1. `gem install rails_template_18f`
1. `rails_template_18f help new` for usage instructions

### Choosing whether to use `--hotwire`

#### Server Rendered _or_ Single Page Applications

`rails_template_18f new <<PATH_TO_PROJECT>>` _or_ `rails_template_18f new <<PATH_TO_PROJECT>> --no-hotwire`

This creates a Rails application that is appropriate for both server-rendered applications,
as well as a basis for installing a separate Single Page Application (SPA) library such as React.

#### A bit more JavaScript needed

`rails_template_18f new <<PATH_TO_PROJECT>> --hotwire`

This creates a Rails application that includes the [Hotwire](https://hotwired.dev/) JavaScript framework.

Hotwire can be used to add [a bit of JavaScript](https://engineering.18f.gov/web-architecture/#:~:text=are%20more%20complex-,If%20your%20use%20case%20requires%20a%20bit%20of%20client%2Dside%20interactivity%2C%20use%20the%20above%20options%20with%20a%20bit%20of%20JavaScript.,-You%20might%20use)
for more interactivity than server-rendered apps, but less than a full SPA.

### Available Options

The following options can be added to change how the template behaves.

**Important:** You must not pass `--skip-bundle` or `--skip-javascript` to `rails_template_18f` or various aspects of the template will be broken

#### `--javascript=esbuild`

Use [esbuild](https://esbuild.github.io/) instead of [webpack](https://webpack.js.org/) for JavaScript bundling. Note that
maintaining IE11 support with esbuild may be tricky.

#### `--no-skip-FRAMEWORK`

Each of the skipped frameworks in `railsrc` can be overridden on the command line. For example: `--no-skip-active-storage` will include support for `ActiveStorage` document uploads

### What default use or `--no-hotwire` does

```
--skip-active-storage   # don't include ActiveStorage for document upload
--skip-action-text      # don't include ActionText libraries for WYSIWYG editing
--skip-action-cable     # don't include ActionCable websocket implementation
--skip-action-mailbox   # don't include inbound email
--skip-hotwire          # don't include Hotwire JS library
--skip-test             # Skip built in test framework. (RSpec included via template.rb)
--javascript=webpack    # Use webpack for JS bundling
--css=postcss           # Use the postcss CSS bundling framework
--template=template.rb  # add additional configuration from template.rb
--database=postgresql   # default to PostgreSQL
```

### What `--hotwire` does

Identical to `--no-hotwire` except that [Hotwire](https://hotwired.dev/) and [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html) are not skipped.

ActionCable is included to enable the [Turbo Streams](https://turbo.hotwired.dev/handbook/streams) functionality of Hotwire.


### What `template.rb` does

1. Create a better default `README`
1. Copy `CONTRIBUTING.md` and `LICENSE.md` from the [18F Open Source Policy repo](https://github.com/18F/open-source-policy/)
1. Create a "near-production" `ci` Rails environment, used for running a11y and security scans
1. Create a "near-production" `staging` Rails environment, used for cloud.gov staging environment, with a "TEST SITE" warning banner
1. Create a `.nvmrc` file for specifying the NodeJS version in use
1. Set up `pa11y-ci` for a11y scanning
1. Set up `OWASP ZAP` dynamic security scanning
1. Include `secure_headers` gem and configure CSP header to get OWASP passing by default
1. Install and configure [brakeman](https://rubygems.org/gems/brakeman) for static security scanning
1. Install `bundler-audit` and set up `bundle:audit` rake task for Ruby dependency security scans
1. Set up `yarn:audit` rake task for JavaScript dependency security scans
1. Install [Standard Ruby](https://github.com/testdouble/standard) for Ruby linting
1. Install [rspec](https://rubygems.org/gems/rspec-rails) for unit testing
1. Install [dotenv](https://rubygems.org/gems/dotenv-rails) for local configuration
1. Setup Rails credential diffing
1. Create a separate production credentials file.
1. Create a `pre-commit` hook that can be used to automatically run ruby linter & terraform format
1. Setup USWDS via postcss
1. Setup webpack with `.browserslistrc` from USWDS
1. Update `app/views/layouts/application.html.erb` to pass the `pa11y-ci` scan and include the USWDS Banner
1. Create a `PagesController` and root route
1. Create boundary and logical data model compliance diagrams
1. Create `manifest.yml` and variable files for cloud.gov deployment
1. Optionally run the `rake db:create` and `rake db:migrate` setup steps
1. Optionally integrate with https://github.com/GSA-TTS/compliance-template
1. Optionally create GitHub Actions workflows for testing and cloud.gov deploy
1. Optionally create terraform modules supporting staging & production cloud.gov spaces
1. Optionally create CircleCI workflows for testing and cloud.gov deploy
1. Optionally create a New Relic config with FEDRAMP-specific host
1. Optionally configure DAP (Digital Analytics Program)
1. Optionally add base translation files and routes for Spanish, French, and Simplified Chinese (es.yml, fr.yml, and zh.yml)
1. Create [Architecture Decision Records](https://adr.github.io/) for above setup
1. Commit the resulting project with git (unless `--skip-git` is passed)

## Use for an existing Rails project

### Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_template_18f", group: :development
```

And then run:

  $ bundle install

Or install it yourself as:

  $ gem install rails_template_18f

### Usage

Run `rails generate` for a list of commands this gem can run

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/18f/rails-template. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/18f/rails-template/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the 18F Rails Template project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rahearn/rails-template-18f/blob/main/CODE_OF_CONDUCT.md).
