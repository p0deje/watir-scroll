module Watir
  class Element

    #
    # Returns scrolling object.
    # @return [Scroll]
    #
    def scroll
      Scroll.new(self)
    end

  end # Element
end # Watir
