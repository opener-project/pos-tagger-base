require_relative 'base/version'

module Opener
  module POSTaggers
    ##
    # The base POS tagger that supports Dutch and German.
    #
    # @!attribute [r] kernel
    #  @return [String]
    # @!attribute [r] lib
    #  @return [String]
    #
    class Base
      ##
      # Builds the command used to execute the kernel.
      #
      # @param [Array] args Commandline arguments passed to the command.
      #
      def command(args = [])
        return "python -E -O #{kernel} #{args.join(' ')}"
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
