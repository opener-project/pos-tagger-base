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


Contact
-------
* Ruben Izquierdo
* Vrije University of Amsterdam
* ruben.izquierdobevia@vu.nl

