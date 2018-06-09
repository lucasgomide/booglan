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
    "Usage: ruby booglan_language.rb <action> <text>\n\nSome useful booblang actions are: preposition, order_words or verb"
  end
end