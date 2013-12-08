require 'cgi'

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

    end
  end
end

