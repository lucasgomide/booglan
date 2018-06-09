require 'test/unit'
require './booglan_language.rb'

class BooglanLanguageTest < Test::Unit::TestCase
  class PrepositionFake
    def perform(text)
      return 'fake preposition returns'
    end
  end

  class OrderWordsFake
    def perform(text)
      return 'fake order words returns'
    end
  end

  class VerbFake
    def perform(text)
      return 'fake verb returns'
    end
  end

  SAMPLE_TEXT = 'hnh fcxm jkd bxwkd gzq wmhxmmjg lvnfj sbbszwrh jvvzgr wjjkbjn bhhfwgn mxdwmx pbfwwvph mfh ncnw zkbx xkwdbdt fngmrcts mzntdhv hsvmlv scgkccbc nhtbksv sjcg gllhcp'.freeze

  PARAMS_ERROR = "Usage: ruby booglan_language.rb <action> <text>\n" +
  "\n" +
  "Some useful booblang actions are: preposition, order_words or verb".freeze

  def test_nil_paramenters
    result = BooglanLanguage.new.perform(nil, nil)
    assert_equal PARAMS_ERROR, result
  end

  def test_paramenters_unknown_action
    result = BooglanLanguage.new.perform('unknown', nil)
    assert_equal PARAMS_ERROR, result
  end

  def test_paramenters_text_nil
    result = BooglanLanguage.new.perform('verb', nil)
    assert_equal PARAMS_ERROR, result
  end

  def test_verb_analysis
    booglan = BooglanLanguage.new(PrepositionFake.new, VerbFake.new, OrderWordsFake.new)
    result = booglan.perform('verb', SAMPLE_TEXT)
    expected = "\n-----------------------------------------------------\nRESULT: fake verb returns\n-----------------------------------------------------"
    assert_equal(expected, result)
  end

  def test_order_words_analysis
    booglan = BooglanLanguage.new(PrepositionFake.new, VerbFake.new, OrderWordsFake.new)
    result = booglan.perform('order_words', SAMPLE_TEXT)
    expected = "\n-----------------------------------------------------\nRESULT: fake order words returns\n-----------------------------------------------------"
    assert_equal(expected, result)
  end


  def test_preposition_analysis
    booglan = BooglanLanguage.new(PrepositionFake.new, VerbFake.new, OrderWordsFake.new)
    result = booglan.perform('preposition', SAMPLE_TEXT)
    expected = "\n-----------------------------------------------------\nRESULT: fake preposition returns\n-----------------------------------------------------"
    assert_equal(expected, result)
  end
end