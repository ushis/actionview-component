# frozen_string_literal: true

module ActionView
  module Component
    module TestHelpers
      def render_inline(component, **args, &block)
        Nokogiri::HTML(ApplicationController.new.view_context.render(component, args, &block))
      end

      def render_component(component, **args, &block)
        ActiveSupport::Deprecation.warn(
          "`render_component` has been deprecated in favor of `render_inline`, and will be removed in v2.0.0."
        )

        render_inline(component, args, &block)
      end
    end
  end
end
