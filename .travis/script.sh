#!/bin/bash

bundle exec rake travis:$TEST_SUITE SPEC_OPTS="--format progress"
