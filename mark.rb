# frozen_string_literal: true

# Defines the marks on the board
class Mark
  attr_reader :type, :position

  def initialize(type, position)
    @type = type
    @position = position
  end
end
