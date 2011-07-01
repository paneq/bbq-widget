require "bbq-widget/version"

module Bbq

  module Widget

    class WithinCssId

      attr_accessor :css_id
      private :css_id=

      # parent must respond to capybara dsl. It does not matter
      # if it is user or widget
      def initialize(parent, css_id)
        @parent = parent
        self.css_id = "##{css_id}"
        return self
      end

      def withinme
        if @withinme
          yield
        else
          begin
            @withinme = true
            @parent.within(:css, css_id) do
              yield
            end
          ensure
            @withinme = false
          end
        end
      end

      def method_missing(method_id, *arguments, &block)
        withinme do
          @parent.send(method_id, *arguments, &block)
        end
      end

      if RUBY_VERSION < '1.9'
        def respond_to?(method_id, include_private = false)
          @parent.respond_to?(method_id) || super
        end
      else
        def respond_to_missing?(method_id, include_private = false)
          @parent.respond_to?(method_id) || super
        end
      end

    end

  end

end
