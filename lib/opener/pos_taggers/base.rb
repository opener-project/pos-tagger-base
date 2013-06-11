require 'open3'
require 'optparse'

require_relative 'base/version'
require_relative 'base/option_parser'

module Opener
  module POSTaggers
    ##
    # The base POS tagger that supports Dutch and German.
    #
    # @!attribute [r] args
    #  @return [Array]
    # @!attribute [r] options
    #  @return [Hash]
    # @!attribute [r] option_parser
    #  @return [OptionParser]
    #
    class Base
      attr_reader :args, :options, :option_parser

      def initialize(options = {})
        @args          = options.delete(:args) || []
        @options       = options
        @option_parser = OptionParser.new
      end

      ##
      # Builds the command used to execute the kernel.
      #
      # @param [Array] args Commandline arguments passed to the command.
      #
      def command
        return "python -E -O #{kernel} #{args.join(' ')}"
      end

      ##
      # Runs the command and returns the output of STDOUT, STDERR and the
      # process information.
      #
      # @param [String] input The input to tag.
      # @return [Array]
      #
      def run(input)
        option_parser.parse(args)

        if !input or input.empty?
          option_parser.show_help
        end

        return Open3.capture3(command, :stdin_data => input)
      end

      protected

      ##
      # @return [String]
      #
      def core_dir
        return File.expand_path('../../../../core', __FILE__)
      end

      ##
      # @return [String]
      #
      def kernel
        return File.join(core_dir, 'pos-tagger_open-nlp.py')
      end
    end # Base
  end # POSTaggers
end # Opener
