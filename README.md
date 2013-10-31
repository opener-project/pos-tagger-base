[![Build Status](https://drone.io/github.com/opener-project/pos-tagger-base/status.png)](https://drone.io/github.com/opener-project/pos-tagger-base/latest)

# Base POS Tagger

This repository contains the source code (both Ruby and Python) for the base
POS tagger. Currently this tagger supports the following languages:

* Dutch
* German

## Requirements

* Python 2.7.0 or newer
* Ruby 1.9.2 or newer
* pip
* libxml2

## Installation

Using Bundler:

    gem 'opener-pos-tagger-base',
      :git    => 'git@github.com:opener-project/pos-tagger-base.git',
      :branch => 'master'

Using `specific_install`:

    gem install specific_install
    gem specific_install opener-pos-tagger-base \
        -l https://github.com/opener-project/pos-tagger-base.git

Using regular RubyGems (once the Gem is available):

    gem install opener-pos-tagger-base

## Usage

Tagging a KAF file:

    cat some_input_file.kaf | pos-tagger-base

## Contributing

First make sure all the required dependencies are installed:

    bundle install

Then download the required Python code:

    bundle exec rake compile

Once this is done continue reading the sections below to get a better
understanding about the repository structure.

## Structure

This repository comes in two parts: a collection of Python source files and
Ruby source code. The Python code can be found in `core/`, the Ruby code can be
found in the other directories (e.g. `lib/`).

Required Python packages are installed locally in to `core/site-packages/X`
where X is one of the following two:

* `pre_build`: contains packages that are installed before building the Gem,
  these packages are shipped with the Gem
* `pre_install`: contains packages that are installed in to this directory upon
  installing the Gem. This directory should exclusively be used for compiled
  Python packages such as lxml.

There are also two requirements files for pip:

* `pre_build_requirements.txt`: installs the requirements for the `pre_build`
  directory.
* `pre_install_requirements.txt`: installs the requirements for the
  `pre_install` directory.

To easily install all the required dependencies (required for running the tests
for example) run the following:

    bundle exec rake compile

This will take care of verifying the requirements and downloading and
installing the Python packages.

## Testing

To run the tests (which are powered by Cucumber), simply run the following:

    bundle exec rake

This will take care of verifying the requirements, installing the Python code
and running the tests.

For more information on the available Rake tasks run the following:

    bundle exec rake -T

## POS Details

### POS-tags models

* [Dutch-maxent](http://opennlp.sourceforge.net/models-1.5/nl-pos-maxent.bin)
* [Dutch-perceptron](http://opennlp.sourceforge.net/models-1.5/nl-pos-perceptron.bin)
* [German-maxent](http://opennlp.sourceforge.net/models-1.5/de-pos-maxent.bin)
* [German-perceptron](http://opennlp.sourceforge.net/models-1.5/de-pos-perceptron.bin)

### POS-tags sets

* Dutch: trained on conllx alpino data, wotan tagset
* German: trained on TIGER corpus, STSS tagset
