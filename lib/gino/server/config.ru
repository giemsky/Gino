#!/usr/bin/env rackup

use Rack::CommonLogger
use Rack::Lint
run Gino::Server::RackApp.new