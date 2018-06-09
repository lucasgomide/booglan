module AddonsString
  def pluralize(word, count)
    "#{word}#{count > 1 ? 's' : ''}"
  end
end