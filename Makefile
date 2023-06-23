# Makefile

install:
	bundle install

lint:
	bundle exec rubocop

lint-x:
	bundle exec rubocop -A

test:
	bundle exec rake test

.PHONY: test
