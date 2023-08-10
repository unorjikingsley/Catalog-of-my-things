# frozen_string_literal: true

class Handler
  def initialize(data)
    @data = data
  end

  def handle
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
