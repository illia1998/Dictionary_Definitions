Dictionary Definitions Documentation
=================

Table of contents
=================

* [Overview](#Overview)
* [Project set-up](#Project set-up)
* [Program execution](#Program execution)
* [Tests execution](#Tests-execution)
    * [RSpec](#Rspec)
    * [Cucumber](#Cucumber)
* [Reporting](#Reporting)
* [The most important note](#The most important note)

# Overview

Hello, fellow dictionary enjoyer!

Welcome to my pet-project created for those who truly appreciate the magic of words
and their meanings. Brace yourself for an adventure filled with linguistic wonders, all wrapped in delightfully average
quality code.

# Project-set-up

In order to make it do things, please follow the next steps:

1) Install ruby using ruby version manager (
   details [Ruby installation](https://www.ruby-lang.org/en/documentation/installation/)).

2) Install all required gems. It can be done via IDE terminal by using this command:

```shell
bundle install
```

3) Install allure reports (details [Allure installation](https://docs.qameta.io/allure/#_installing_a_commandline))

```shell
brew install allure
```

# Program execution

This project is divided into two main programs, which basically do the same job just using different approaches.
There are two ways you can search for a definition of your favorite word:

1) #### Via html parse of [Oxford Learner's Dictionary](https://www.oxfordlearnersdictionaries.com/definition/english)

Available word types: sense, idiom, origin

In 'client.rb':

```shell
DictionaryDefinitionsParse.new(:word_type).definition_for('word')
```

To use terminal input:

```shell
DictionaryDefinitionsParse.new(:word_type).definition_for
```

To retrieve definitions for a random word:

```shell
DictionaryDefinitionsParse.new(:word_type).random_definition
```

2) #### Via api of [Free Dictionary API](https://api.dictionaryapi.dev/api/v2/entries/en/)

Available word types: noun, synonym, audio

In 'client.rb':

```shell
DictionaryDefinitionsApi.new(:word_type).definition_for('word')
```

To use terminal input:

```shell
DictionaryDefinitionsApi.new(:word_type).definition_for
```

To retrieve definitions for a random word:

```shell
DictionaryDefinitionsApi.new(:word_type).random_definition
```

### Execute the program:

```shell
bin/client.rb
```

# Tests execution

Navigate to the 'tests' folder:

```shell
cd tests
```

### RSpec

In order to run all specs:

```shell
rake spec:all
```

In order to run all specs in 4 parallel threads:

```shell
rake spec:parallel
```

### Cucumber

In order to run all Cucumber features:

```shell
rake cucumber:all_features
```

In order to run all Cucumber features in 4 parallel threads:

```shell
rake cucumber:parallel
```

# Reporting

After your tests executed, all necessary for reporting directories will be created.
To open generated allure report you need to run:

```shell
allure open
```

# The most important note

![If you're not having fun, then you're doing it wrong](https://blowmage.com/images/rubyfunwrong.png)