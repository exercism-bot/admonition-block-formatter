class AdmonitionBlockFormatter
  def self.format(code) = code.gsub(BACKTICK_MATCH_REGEX, TILDE_REPLACE)

  BACKTICK_MATCH_REGEX = /(?<start>`{3,})(?<type>exercism\/[a-z]+)(?<admonition>[\s\S]*?)(?<end>\k<start>)/.freeze
  TILDE_REPLACE = '~~~~\k<type>\k<admonition>~~~~'.freeze
end

