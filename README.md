# Booglan Lisguistic Analyse
[![codecov](https://codecov.io/gh/lucasgomide/booglan/branch/master/graph/badge.svg)](https://codecov.io/gh/lucasgomide/booglan)

[![Build Status](https://travis-ci.org/lucasgomide/booglan.svg?branch=master)](https://travis-ci.org/lucasgomide/booglan)

This tool has been developed to help some teachers to teach and to analyse some fundamental characteristics of the mysterious Booglan language.

## Requirements

Ruby >= 2.3
**OR**
Docker

## Install

`bundle exec install`

**If you prefer run it using docker** just run these commands bellow

To build the app

`docker build -t booglan-analyse .`

To run the command to analyse Booglan language

`docker run -it --rm --name booglan-analyse -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.4 ruby main.rb preposition "TEXT HERE"`

## Usage

It's really *easy* to use this tool, look at the command bellow.

```shell
ruby main.rb <analysis_type> <text>
```

As you can see above.. easy piece. You have to put `ruby main.rb` followed by the analisis type and the text to be analised on your terminal. We're going to see the attributes' description.

**analysis_type** means the type of analisies. Four kinds of analysis have been developed. They are *verb*, *preposition*, *order_words* and *pretty_numbers*.

**text** means the text in Booglan to be analised.

### How to use "Preposition Analisis"

```shell
ruby main.rb preposition "hnh fcxm jkd bxwkd gzq wmhxmmjg lvnfj sbbszwrh jvvzgr wjjkbjn bhhfwgn mxdwmx pbfwwvph mfh ncnw zkbx xkwdbdt fngmrcts mzntdhv hsvmlv scgkccbc nhtbksv sjcg gllhcp jqkxw szdwqjn kbvkhct jkn bbrmrr qrf qsxfl dzdfg jccxzzkj rqdrrttj fmmrwn kdrqdp hkvgnn fkf swrbr tjnd qjk rqvnt thh qbhgfjc gbgfsj dxrxrhwv ldssvhhr sskdpzk hsff gtwdzvbd scntx wtf fvvsrw gpwxfgd rtpffmcf bcnfbb gtnmldrf dfztff nxprpq crpmz grlqvpr pzxvb jfcv pwz xwkxr ggvfqgl qqgcx jtpxn qddnj pdkphhrn cftt jbxr"
```

**Output**
The expected result is

```text
-----------------------------------------------------
RESULT: This text has 7 prepositions
-----------------------------------------------------
```

#### How to use "Verb Analisis"

```shell
ruby main.rb verb "hnh fcxm jkd bxwkd gzq wmhxmmjg lvnfj sbbszwrh jvvzgr wjjkbjn bhhfwgn mxdwmx pbfwwvph mfh ncnw zkbx xkwdbdt fngmrcts mzntdhv hsvmlv scgkccbc nhtbksv sjcg gllhcp jqkxw szdwqjn kbvkhct jkn bbrmrr qrf qsxfl dzdfg jccxzzkj rqdrrttj fmmrwn kdrqdp hkvgnn fkf swrbr tjnd qjk rqvnt thh qbhgfjc gbgfsj dxrxrhwv ldssvhhr sskdpzk hsff gtwdzvbd scntx wtf fvvsrw gpwxfgd rtpffmcf bcnfbb gtnmldrf dfztff nxprpq crpmz grlqvpr pzxvb jfcv pwz xwkxr ggvfqgl qqgcx jtpxn qddnj pdkphhrn cftt jbxr"
```

**Output**
The expected result is

```text
-----------------------------------------------------
RESULT: This text has 10 verbs and 7 inflected verbs
-----------------------------------------------------
```

#### Ordering words

```shell
ruby main.rb order_word "hnh fcxm jkd bxwkd gzq wmhxmmjg lvnfj sbbszwrh jvvzgr wjjkbjn bhhfwgn mxdwmx pbfwwvph mfh ncnw zkbx xkwdbdt fngmrcts mzntdhv hsvmlv scgkccbc nhtbksv sjcg gllhcp jqkxw szdwqjn kbvkhct jkn bbrmrr qrf qsxfl dzdfg jccxzzkj rqdrrttj fmmrwn kdrqdp hkvgnn fkf swrbr tjnd qjk rqvnt thh qbhgfjc gbgfsj dxrxrhwv ldssvhhr sskdpzk hsff gtwdzvbd scntx wtf fvvsrw gpwxfgd rtpffmcf bcnfbb gtnmldrf dfztff nxprpq crpmz grlqvpr pzxvb jfcv pwz xwkxr ggvfqgl qqgcx jtpxn qddnj pdkphhrn cftt jbxr"
```

**Output**
The expected result is

```text
-----------------------------------------------------
RESULT: thh tjnd wtf wjjkbjn wmhxmmjg hkvgnn hnh hsff hsvmlv zkbx kdrqdp kbvkhct dzdfg dfztff dxrxrhwv fkf fvvsrw fcxm fngmrcts fmmrwn cftt crpmz jtpxn jkd jkn jfcv jvvzgr jccxzzkj jqkxw jbxr xwkxr xkwdbdt ldssvhhr lvnfj rtpffmcf rqdrrttj rqvnt nhtbksv ncnw nxprpq qddnj qjk qrf qqgcx qsxfl qbhgfjc mzntdhv mfh mxdwmx gtwdzvbd gtnmldrf gzq gllhcp grlqvpr ggvfqgl gpwxfgd gbgfsj pwz pzxvb pdkphhrn pbfwwvph swrbr szdwqjn scntx scgkccbc sjcg sskdpzk sbbszwrh bhhfwgn bcnfbb bxwkd bbrmrr
-----------------------------------------------------
```

#### How to use "Pretty Numbers Analysis"

```shell
ruby main.rb pretty_numbers "hnh fcxm jkd bxwkd gzq wmhxmmjg lvnfj sbbszwrh jvvzgr wjjkbjn bhhfwgn mxdwmx pbfwwvph mfh ncnw zkbx xkwdbdt fngmrcts mzntdhv hsvmlv scgkccbc nhtbksv sjcg gllhcp jqkxw szdwqjn kbvkhct jkn bbrmrr qrf qsxfl dzdfg jccxzzkj rqdrrttj fmmrwn kdrqdp hkvgnn fkf swrbr tjnd qjk rqvnt thh qbhgfjc gbgfsj dxrxrhwv ldssvhhr sskdpzk hsff gtwdzvbd scntx wtf fvvsrw gpwxfgd rtpffmcf bcnfbb gtnmldrf dfztff nxprpq crpmz grlqvpr pzxvb jfcv pwz xwkxr ggvfqgl qqgcx jtpxn qddnj pdkphhrn cftt jbxrl xkqxcwpm xmfb fzphplvn gcksvmk jhxtm mdjwn zpslsgr vjjttfb cbsnch pgjwwdjh crp tmjzvn bqvn jhhfbd hthpzcq ltnpw wtffzw kjhpkc mnmqt mdvvc qjqdpwdh vktglnvt dmkvqc zblsrsqb crrkmcb fvh hqcv rgbpwbf wfv hgq grbrpfk ddjbq lqnnk frzxbzb phd fdrbn hbxlb wvbnq mhq whtpldh djx tzdrgpm csdqcl bgpc kdsgjhp ljbqg pgllk sblhr jzsbq vrwnspc zrhpwck htqlk lll pqjjjx"
```

**Output**
The expected result is

```text
-----------------------------------------------------
RESULT: This text has 28 pretty numbers
-----------------------------------------------------
```

## UnitTests

The test suit is really simple, all of them are inside `/test/unit/*`.

The command to run them is `bundle exec rake test`

**If you prefer run it using docker** just run the command above

`docker run -it --rm --name booglan-analyse -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.4 bundle install; bundle exec rake test`
