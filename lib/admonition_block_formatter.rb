class AdmonitionBlockFormatter
  def self.format(code)
    [:format_four, :format_three].each do |meth|
      while code != (new_code = send(meth, code))
        code = new_code
      end
    end

    code
  end

  def self.format_three(code)
    matches = THREE_TILDE_REGEX.match(code)
    return code unless matches

    matches['before'] + "~~~~" + matches['type'] + matches['admonition'] + "~~~~" + matches['after']
  end

  def self.format_four(code)
    matches = FOUR_TILDE_REGEX.match(code)
    return code unless matches

    matches['before'] + "~~~~" + matches['type'] + matches['admonition'] + "~~~~" + matches['after']
  end

  THREE_TILDE_REGEX = /(?<before>[\s\S]*)(?<start>```)(?<type>exercism\/[a-z]+)(?<admonition>[\s\S]*?)(?<end>```)(?<after>[\s\S]*)/.freeze
  FOUR_TILDE_REGEX = /(?<before>[\s\S]*)(?<start>````)(?<type>exercism\/[a-z]+)(?<admonition>[\s\S]*?)(?<end>````)(?<after>[\s\S]*)/.freeze
end

