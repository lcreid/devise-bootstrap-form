# Devise Bootstrap Form

This gem gives you a nicer place to start customizing views for your Devise model when you're using the [`bootstrap_form`](https://github.com/bootstrap-ruby/bootstrap_form) gem. The `bootstrap_form` gem makes it easier to generate nice-looking Bootstrap forms in Rails. If you're using `bootstrap_form`, this gem will help make your Devise views look the same as the rest of the forms in your application.

It also makes the Devise views simpler, because the code to define forms using `bootstrap_form` is simpler than the code for a "raw" Rails form. So any customization you do to the Devise views will be simpler.

You can find usage information below, but the gist of it is you'll run `rails g devise:views:bootstrap_form` instead of the normal `rails g devise:views`.

If you're just looking for Bootstrap markup on your Devise views, and don't want to use `bootstrap_form`, then you should look into the [`devise-bootstrapped`](https://github.com/king601/devise-bootstrapped) gem, or the [`devise-bootstrap-views`](https://github.com/hisea/devise-bootstrap-views) gem.

## Installation

Add these lines to your application's `Gemfile`:

```ruby
gem "bootstrap_form", "~> 5.0"
gem 'devise'
# gem 'devise-i18n'
# gem 'devise_invitable'
gem 'devise-bootstrap-form'
```

And then execute:

```bash
bundle install
```

There are additional installation instructions for [`bootstrap_form`](https://github.com/bootstrap-ruby/bootstrap_form#installation),  [`bootstrap`](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails), [`devise`](https://github.com/plataformatec/devise) that you must complete before using `devise-bootstrap-form`, and
[`devise-i18n`](https://github.com/tigrish/devise-i18n).

Note that as of Devise 4.6.0, `devise_error_messages!` is deprecated in favour of the `_error_messages.html.erb` partial. `devise-bootstrap-form` versions 0.3.0 and higher generate views that use the `_error_messages.html.erb` partial. If you need to use `devise_error_messages!`, use this line in your `Gemfile`:

```ruby
gem 'devise-bootstrap-form', '<= 0.2.0'
```

## Usage

Once all the gems are installed and configured, and the user model is generated, you can generate the Bootstrap Form views with:

```bash
rails generate devise:views:bootstrap_form
```

If you've already generated the Devise views you can use the `-f` argument to force an override, but that will erase any of the changes you've made to the views.

Generate the mailer views from normal Devise, as they're not included in `devise-bootstrap-form`:

```bash
rails generate devise:views -v mailer
```

To switch back to what Devise gives you, remove the `app/views/devise` folder. Your application will then use the default Devise views, or you can run the normal Devise `rails g devise:views` generator command and customize the default Devise views.

## Generated Layout

The generated view is just like the default Devise, but any form elements (e.g. e-mail field) are created using the `bootstrap_form` helpers rather than the stock Rails helpers. This ensures that your Devise forms will have a consistent look with the rest of the forms in your application.

The generated view provides a pretty simple vertical layout. You can, and probably will, customize the generated views to your own tastes.

Here's what the sign in view looks like (internationalized version):

```html
<h2 class="text-center"><%= t(".sign_in") %></h2>
<%= bootstrap_form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
<%= f.email_field :email, autofocus: true, autocomplete: "email" %>
<%= f.password_field :password, autocomplete: "current-password", placeholder: "Password" %>

<% if devise_mapping.rememberable? -%>
  <%= f.form_group do %>
  <%= f.check_box :remember_me %>
<% end %>
<% end -%>

<%= f.form_group class: "d-grid" do %>
  <%= f.submit t(".sign_in"), class: "btn btn-primary btn-lg" %>
<% end %>
<% end %>
<div class="text-center">
  <%= render "devise/shared/links" %>
</div>
```

## Internationalization

If your `Gemfile` includes `devise-i18n`, `devise-bootstrap-form` will generate views with translations. If you're also using `devise_invitable`, you have to manually copy its translations into your application from the [`devise_invitable` wiki](https://github.com/scambra/devise_invitable/wiki/I18n).

Also, don't forget to add `gem "rails-i18n"` to your `Gemfile`.

## Differences from the Previous Version

- The generator no longer provides styles to format the Devise pages.
- The generator no longer makes assumptions about the asset pipeline you're using, i.e. it doesn't assume you're using SASS, and it doesn't modify `app/assets/stylesheets/application.scss`.
- The views are no longer wrapped in rows and columns. Out of the box the views are easier to drop into whatever formatting and layout you want.
- Bootstrap 5 dropped the `btn-block` class, and `devise-bootstrap-form` used it on the default button in each view. See below for the view change.

### Changes in the Generated Views

Each view has a submit button, and the Bootstrap 4 mark-up looks like this:

```ruby
<%= f.form_group do %>
  <%= f.submit t('.sign_up'), class: "btn btn-primary btn-block btn-lg" %>
<% end %>
```

With Bootstrap 5, it looks like this:

```ruby
<%= f.form_group class: "d-grid" do %>
  <%= f.submit t(".sign_up"), class: "btn btn-primary btn-lg" %>
<% end %>
```

## Upgrading an Existing App to Bootstrap 5

If you're upgrading an existing app to Bootstrap 5, it's probably easiest to just apply the [changes to the views](changes-in-the-generated-views) manually. The only time it would be worthwhile to regenerate the Bootstrap 5 forms would be if hadn't modified the generated forms.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Code of Conduct](CODE_OF_CONDUCT.md).

Refer to the [CONTRIBUTING](devise-bootstrap-form/blob/master/CODE_OF_CONDUCT.md) document for more details.

Bug reports and pull requests are welcome on GitHub at https://github.com/lcreid/devise-bootstrap-form.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
