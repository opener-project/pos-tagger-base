module Opener
   module Kernel
     module VU
       module POSTagger
    	 module OpenNLP
    	   module NL
      		VERSION = "0.0.1"

      		class Configuration
        		CORE_DIR    = File.expand_path("../core", File.dirname(__FILE__))
        		KERNEL_CORE = CORE_DIR+'/pos-tagger_open-nlp.py'
      		end

    	  end
    	end
      end
    end
  end
end

KERNEL_CORE=Opener::Kernel::VU::POSTagger::OpenNLP::NL::Configuration::KERNEL_CORE
