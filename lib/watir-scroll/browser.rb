module Watir
  class Browser

    #
    # Returns scrolling object.
    # @return [Scroll]
    #
    def scroll
      Scroll.new(self)
    end

  end # Browser
end # Watir
