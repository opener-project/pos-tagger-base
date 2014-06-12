require_relative '../../lib/opener/pos_taggers/base'
require 'rspec'

def kernel
  return Opener::POSTaggers::Base.new
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
