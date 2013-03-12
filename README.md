
VU-pos-tagger-opennlp_NL_kernel
==============================

This module implements a wrapper for the open-nlp pos tagger tool. The input should be KAF text with the token layer (for instance the KAF create by one of our tokenizers).
The output will be the input KAF extended with the term layer, including the part-of-speech information.

The module uses the models trained on the alpino data with the Open-nlp toolkit. This module currently works for Dutch and the pos models have been downloaded from
http://opennlp.sourceforge.net/models-1.5/


Usage
-----
The main script is the file core/pos-tagger_open-nlp.py. If we have our intput KAF with the token layer in a file called input.token.kaf, we could run the pos-tagger as:
````shell
$ cat input.token.kaf | core/pos-tagger_open-nlp.py > out.token.pos.kaf
````
This would generate the output file out.token.pos.kaf witht the extenden KAF

All the required libraries and binaries related to Opennlp have been bundled in the repository (in the folder lib.


## Installation

Add this line to your application's Gemfile:

    gem 'VU-pos-tagger-opennlp_NL_kernel', :git=>"git@github.com/opener-project/VU-pos-tagger-opennlp_NL_kernel.git"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem specific_install VU-pos-tagger-opennlp_NL_kernel -l https://github.com/opener-project/VU-pos-tagger-opennlp_NL_kernel.git


If you dont have specific_install already:

    $ gem install specific_install

## Usage

Once installed as a gem you can access the gem from anywhere:


TODO: Change output below as needed
````shell
echo "foo" | VU-pos-tagger-opennlp_NL_kernel
````

Will output

````
oof
````

## Contributing

1. Pull it
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. If you're confident, merge your changes into master.


Contact
-------
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl

