module Poly
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../', __FILE__)

      desc 'Copy initializer file'
      class_option :orm

      def copy_initializer
        template 'templates/poly_config.rb', 'config/initializers/poly_config.rb'

        #if Gem::Specification::find_all_by_name('activeadmin').any?
        #  STDOUT << 'admin'
        #  template 'templates/active_admin/emails.rb', 'app/admin/email_templates.rb'
        #end
      end
    end
  end
end