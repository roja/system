# Developer Notes

* Use [semantic versioning](http://semver.org).
* Documentation in [YARD](http://rubydoc.info/docs/yard/file/docs/GettingStarted.md).

## Setup Development Environment

```sh
$ bundle install
$ bundle exec guard
```

Some tools do not have a Guard task, but do have a Rake task.

### Mutant

This takes forever and will output to the `spec/mutants.txt` file as well as stdout.

```
$ rake mutant
```

## Releasing

### Checklist

* No code smells
* Test coverage is 100%
* All tests pass
* No sensible test mutations
* Documentation coverage is 100%
* Rubocop passes
* Changes committed and pushed

### Deploying

```rb
$ bundle exec rake version:bump
$ git push
$ bundle exec rake gem
$ gem push pkg/system-VERSION.gem
```

Bumping the version will also tag the latest commit as the new version.
