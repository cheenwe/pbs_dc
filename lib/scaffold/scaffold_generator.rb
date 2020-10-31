require 'rails/generators/named_base'
require 'rails/generators/resource_helpers'

module All # :nodoc:
  module Generators # :nodoc:
    class ScaffoldGenerator < Rails::Generators::NamedBase # :nodoc:
      include Rails::Generators::ResourceHelpers

      source_root File.join(Rails.root, 'lib', 'templates', 'erb', 'scaffold', File::SEPARATOR)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views", controller_file_path)
      end

      def copy_view_files
        available_views.each do |view|
          template view, File.join("app/views", controller_file_path, view)
        end
      end

      def copy_templates
        template File.join("#{Rails.root}/lib/templates/erb/scaffold/zh.yml"), File.join("config/locales/zh-CN/#{plural_table_name}.yml")
        template File.join("#{Rails.root}/lib/templates/erb/scaffold/en.yml"), File.join("config/locales/en/#{plural_table_name}.yml")
      end
    protected
      def available_views
        base = self.class.source_root
        base_len = base.length
        Dir[File.join(base, '**', '*.erb')].select { |f| File.file?(f) }.map{|f| f[base_len..-1]}
        # %w(index edit show new _form)
      end
    end
  end
end
