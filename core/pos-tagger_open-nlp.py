#!/usr/bin/env python
#-*- coding: utf8 *-*

import os

this_folder = os.path.dirname(os.path.realpath(__file__))
opennlp_folder = os.path.join(this_folder,'opennlp')
model_folder = os.path.join(opennlp_folder,'models')
pos_model = 'nl-pos-maxent.bin'

__version__ = '1.0 8-Mar-2013'

## Last changes
###################################

## TO DO
# Deal with the tag set..

import sys
import operator
import time
import getopt
import string
import subprocess
from lxml.etree import ElementTree as ET, Element as EL, PI
from VUKafParserPy.KafParserMod import KafParser
from token_matcher import token_matcher



if __name__=='__main__':
    
  if sys.stdin.isatty():
      print>>sys.stderr,'Input stream required.'
      print>>sys.stderr,'Example usage: cat myUTF8file.kaf |',sys.argv[0]
      sys.exit(-1)
  
  time_stamp = True
  try:
    opts, args = getopt.getopt(sys.argv[1:],"l:",["no-time"])
    for opt, arg in opts:
      if opt == "--no-time":
        time_stamp = False
  except getopt.GetoptError:
    pass
    
  
  input_kaf = KafParser(sys.stdin)
  my_lang = input_kaf.getLanguage()
  
  if my_lang != 'nl':
    print>>sys.stderr,'The language of the input KAF is '+my_lang+' and only can be Dutch (nl)'
    sys.exit(-1)
    
  
  
  ## Create the input text for
  reference_tokens = []
  sentences = []
  prev_sent='-200'
  aux = []
  for word, sent_id, w_id in input_kaf.getTokens():
    if sent_id != prev_sent:
      if len(aux) != 0:
        sentences.append(aux)
        aux = []
    aux.append((word,w_id))
        
    prev_sent = sent_id
  if len(aux)!=0:
    sentences.append(aux)
    
  for sentence in sentences:
    text = ' '.join(t for t,_ in sentence).encode('utf-8')
    cmd = [os.path.join(opennlp_folder,'bin/opennlp'), 'POSTagger',os.path.join(model_folder,pos_model)]
    try:
      proc = subprocess.Popen(cmd,stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      proc.stdin.write(text)
      proc.stdin.close()
      text_with_pos = proc.stdout.read().strip().decode('utf-8')  ## variable is unicode
      proc.terminate()
    except Exception as e:
       print>>sys.stderr,str(e)
       sys.exit(-1)
       
    data = {}
    new_tokens = []
    for n, token in enumerate(text_with_pos.split(' ')):
      position = token.rfind('_')
      lemma = token[:position]
      pos = token[position+1:]
      pos = token[-1]
      if pos in ['N','R','G','V','A','O']:
        type_term = 'open'
      else:
        type_term = 'close'
      my_id='t_'+str(n)
      data[my_id] = (lemma,pos,type_term)
      new_tokens.append((lemma,my_id))
      
    mapping_tokens = {}
    token_matcher(sentence,new_tokens,mapping_tokens)
    for token_new,id_new in new_tokens:
      lemma,pos,type_term = data[id_new]
      ele_term = EL('term',attrib={'tid':id_new,
                                   'type':type_term,
                                   'pos':pos,
                                   'morphofeat':pos,
                                   'lemma':lemma})
      ref_tokens = mapping_tokens[id_new]
      ele_span = EL('span')
      for ref_token in ref_tokens:
        eleTarget = EL('target',attrib={'id':ref_token})
        ele_span.append(eleTarget)
      ele_term.append(ele_span)
      
      input_kaf.addElementToLayer('terms', ele_term)
    
  input_kaf.addLinguisticProcessor('Open nlp pos tagger','1.0', 'term', time_stamp)
  input_kaf.saveToFile(sys.stdout)
  sys.exit(0)

 

