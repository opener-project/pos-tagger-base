module Opener
  module POSTaggers
    class Base
      ##
      # Configures the CLI options for the base tagger using OptionParser.
      #
      # @!attribute [r] parser
      #  @return [OptionParser]
      #
      class OptionParser
        attr_reader :parser

        def initialize
          @parser = ::OptionParser.new do |opts|
            opts.banner = 'Usage: cat input_file.kaf ' \
              '| opener-pos-tagger-base [OPTIONS]'

            opts.on('-h', '--help', 'Shows this help message') do
              show_help
            end

            opts.on('-v', '--version', 'Shows the version') do
              puts "opener-pos-tagger-base v#{VERSION} #{RUBY_DESCRIPTION}"
              exit
            end
          end
        end

        ##
        # Convenience method for parsing options without having to include
        # `.parser` in the call chain.
        #
        def parse(*args)
          return parser.parse(*args)
        end

        ##
        # Shows the help message and aborts.
        #
        def show_help
          abort parser.to_s
        end
      end # OptionParser
    end # Base
  end # POSTaggers
end # Opener
