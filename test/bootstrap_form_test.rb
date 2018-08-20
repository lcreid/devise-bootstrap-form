# frozen_string_literal: true

require "test_helper"

class BootstrapFormTest < Test
  def test_has_a_version_number
    refute_nil Devise::BootstrapForm::VERSION
  end

  # The following will try to render the template, but will fail because it depends
  # on a lot coming from the Devise controller.
  # def test_sign_in_view
  #   ActionController::Base.render(file: File.join(@view_root, "registrations", "new"))
  #   flunk
  # end
end