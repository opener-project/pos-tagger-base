require 'open3'
require_relative 'base/version'

module Opener
  module POSTaggers
    ##
    # The base POS tagger that supports Dutch and German.
    #
    # @!attribute [r] args
    #  @return [Array]
    # @!attribute [r] options
    #  @return [Hash]
    #
    class Base
      attr_reader :args, :options

      ##
      # @param [Hash] options
      #
      # @option options [Array] :args The commandline arguments to pass to the
      #  underlying Python script.
      #
      def initialize(options = {})
        @args          = options.delete(:args) || []
        @options       = options
      end

      ##
      # Builds the command used to execute the kernel.
      #
      # @return [String]
      #
      def command
        return "#{adjust_python_path} python -E -OO #{kernel} #{args.join(' ')}"
      end

      ##
      # Runs the command and returns the output of STDOUT, STDERR and the
      # process information.
      #
      # @param [String] input The input to tag.
      # @return [String]
      #
      def run(input)
        stdout, stderr, process = capture(input)

        raise stderr unless process.success?

        return stdout
      end

      protected
      ##
      # @return [String]
      #
      def adjust_python_path
        site_packages =  File.join(core_dir, 'site-packages')
        "env PYTHONPATH=#{site_packages}:$PYTHONPATH"
      end

      ##
      # capture3 method doesn't work properly with Jruby, so
      # this is a workaround
      #
      def capture(input)
        Open3.popen3(*command.split(" ")) {|i, o, e, t|
          out_reader = Thread.new { o.read }
          err_reader = Thread.new { e.read }
          i.write input
          i.close
          [out_reader.value, err_reader.value, t.value]
        }
      end

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

    class DE < Base
    end # DE

  end # POSTaggers
end # Opener
