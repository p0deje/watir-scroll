module Watir
  class Element
    class Scroll
      def initialize(element)
        @element = element
      end

      #
      # Scrolls to element.
      # @param [Symbol] param Position to which you want to scroll.
      #   Possibilities are :top, :start, :center, :bottom, :end
      # @param [Integer] offset_top Vertical offset
      # @param [Integer] offset_left Horizontal offset
      #
      def to(param = :top, offset_top = 0, offset_left = 0)
        args = case param
               when :top, :start
                 [
                   'arguments[0].scrollIntoView();'\
               "window.scrollBy(#{offset_left},#{offset_top});",
                   @element
                 ]
               when :center
                 [
                   'var elementRect = arguments[0].getBoundingClientRect();'\
               'var top = elementRect.top - (window.innerHeight / 2);' \
               'var left = elementRect.left - (window.innerWidth / 2);' \
               "window.scrollTo(left + #{offset_left}, top + #{offset_top});",
                   @element
                 ]
               when :bottom, :end
                 [
                   'arguments[0].scrollIntoView(false);'\
               "window.scrollBy(#{offset_left},#{offset_top});",
                   @element
                 ]
               else
                 raise ArgumentError, "Don't know how to scroll element to: #{param}!"
               end
        @element.browser.execute_script('window.scrollTo(0,0);')
        @element.browser.execute_script(*args)
      end
    end # Scroll
  end # Element
end # Watir
