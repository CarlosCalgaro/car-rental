require "rubygems"
require "bundler/setup"

Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
