require './booglan/preposition.rb'
require './booglan/verb.rb'
require './booglan/order_words.rb'

class BooglanLanguage
  def initialize(
    preposition_service = Booglan::Preposition.new,
    verb_service = Booglan::Verb.new,
    order_words_service = Booglan::OrderWords.new
  )
    @preposition_service = preposition_service
    @verb_service = verb_service
    @order_words_service = order_words_service
  end

  def perform(action, text)
    service = case action
    when 'preposition' then @preposition_service
    when 'order_words' then @order_words_service
    when 'verb' then @verb_service
    else
      return error_message
    end
    return error_message unless text

    "\n-----------------------------------------------------\nRESULT: #{service.perform(text)}\n-----------------------------------------------------"
  end

  private
  def error_message
    "\nUsage: ruby main.rb <analysis_type> <text>\n\n--------COMMANDS DESCRIPTIONS--------\n\n- analysis_type means the type of analisies.Three kinds of analysis \nhave been developed. They are: verb, preposition and order_words\n\n- text means the text in Booglan to be analised."
  end
end