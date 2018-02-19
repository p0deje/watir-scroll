module Watir
  class Element
    class Scroll

      def initialize(element)
        @element = element
      end

      #
      # Scrolls to element.
      # @param [Symbol] param
      #
      def to(param = :top)
        args = case param
               when :top, :start
                 ['arguments[0].scrollIntoView();', @element]
               when :center
                 script = <<-JS
                   var bodyRect = document.body.getBoundingClientRect();
                   var elementRect = arguments[0].getBoundingClientRect();
                   var left = (elementRect.left - bodyRect.left) - (window.innerWidth / 2);
                   var top = (elementRect.top - bodyRect.top) - (window.innerHeight / 2);
                   window.scrollTo(left, top);
                 JS
                 [script, @element]
               when :bottom, :end
                 ['arguments[0].scrollIntoView(false);', @element]
               else
                 raise ArgumentError, "Don't know how to scroll element to: #{param}!"
               end
        @element.browser.execute_script(*args)

        self
      end

      #
      # Scrolls by offset.
      # @param [Fixnum] left Horizontal offset
      # @param [Fixnum] top Vertical offset
      #
      def by(left, top)
        @element.execute_script('window.scrollBy(arguments[0], arguments[1]);', Integer(left), Integer(top))
        self
      end

    end # Scroll
  end # Element
end # Watir
