require 'cgi'
require 'rack'

module Precious
  module Views
    class Layout
      # Passthrough additional omniauth parameters for status bar
      def user_authed
        @user_authed
      end

      def user_provider
        @user.provider
      end

      def user_name
        @user.name
      end

      def base_url
        "#{@env['rack.url_scheme']}://#{@env['HTTP_HOST']}"
      end
    end
  end
end

