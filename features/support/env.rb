require_relative '../../lib/opener/pos_taggers/base'
require 'rspec/expectations'

def kernel
  return Opener::POSTaggers::Base.new
end
