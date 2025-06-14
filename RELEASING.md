# Releasing

Follow these steps to release a new version of `devise-bootstrap-form` to `rubygems.org`.

## Prerequisites

* You must have commit rights to the `devise-bootstrap-form` repository.
* You must have push rights for the `devise-bootstrap-form` gem on `rubygems.org`.
* You must be using Ruby >= 3.2.

## How to release

1. Run `bundle install` to make sure that you have all the gems necessary for testing and releasing.
2. **Ensure the tests are passing** by running `rake`.
3. Determine which would be the correct next version number according to [semver](http://semver.org/).
4. Update the version in `./lib/devise_bootstrap_form/version.rb`.
5. Update the `CHANGELOG.md` (for an illustration of these steps, refer to the [bootstrap_form 4.0.0.alpha1 commit](https://github.com/bootstrap-ruby/devise-bootstrap-form/commit/8aac3667931a16537ab68038ec4cebce186bd596#diff-4ac32a78649ca5bdd8e0ba38b7006a1e) as an example):
    * Add a new Pending Release section at the top of the file with a template for contributors to fill in, including "Your contribution here!" bullets
    * Rename the Pending Release section to `[version][] (date)` with appropriate values for `version` and `date`
    * Remove the "Your contribution here!" bullets from the former Pending Release section release notes
    * Add the appropriate GitHub diff links to the footer of the document

```
    [Pending Release]: https://github.com/lcreid/devise-bootstrap-form/compare/.v0.0.1...HEAD
    [0.0.1]: https://github.com/lcreid/devise-bootstrap-form/compare/...v0.0.1
```

6. Update the installation instructions in `README.md` to use the new version.
7. Commit the CHANGELOG and version changes in a single commit; the message should be "Preparing vX.Y.Z" where `X.Y.Z` is the version being released.
8. Run `bundle exec rake release`; this will tag, push to GitHub, publish to `rubygems.org`, and upload the latest CHANGELOG entry to the [GitHub releases page](https://github.com/lcreid/devise-bootstrap-form/releases).
