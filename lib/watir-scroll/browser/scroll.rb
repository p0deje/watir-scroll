module Watir
  class Browser
    class Scroll

      def initialize(browser)
        @browser = browser
      end

      #
      # Scrolls to position.
      # @param [Symbol, Array<Fixnum>] param
      #
      def to(param)
        args = case param
               when :top, :start
                 'window.scrollTo(0, 0);'
               when :center
                 'window.scrollTo(window.outerWidth / 2, window.outerHeight / 2);'
               when :bottom, :end
                 'window.scrollTo(0, document.body.scrollHeight);'
               when Array
                 ['window.scrollTo(arguments[0], arguments[1]);', Integer(param[0]), Integer(param[1])]
               else
                 raise ArgumentError, "Don't know how to scroll to: #{param}!"
               end

         @browser.execute_script(*args)
      end

    end # Scroll
  end # Browser
end # Watir
