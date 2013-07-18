module Poly
  module Dsl
    module Views
      class HtmlTag
        DELIMITER_TAGS = %w(br base bgsound frame hr img link meta)
        attr_accessor :tag_name, :tag_attributes, :tag_content

        def initialize name, *content_or_attributes, &block
          @tag_name = name
          parameters_proceeding(content_or_attributes, &block)
        end

        def to_s
          if DELIMITER_TAGS.include?(@tag_name)
            delimiter_tag
          else
            scope_tag
          end
        end

        protected
          def format_attributes
            case tag_attributes.class.name
              when 'String', 'NilClass'
                tag_attributes.to_s
              when 'Hash'
                "#{tag_attributes.map {|k,v| "#{k}=\"#{v}\""}.join(' ')}"
              else
                raise "Attributes presentation #{tag_attributes.class.name} not valid. Valid presentation: String or Hash"
            end
          end

          def parameters_proceeding(content_or_attributes, &block)
            @tag_attributes, @tag_content =
              if block_given?
                #[content_or_attributes.first || Hash.new, yield(self).to_s]
                [content_or_attributes.first || {}, View.new(&block).to_s]
              else
                raise 'Attributes count is invalid' if content_or_attributes.length == 0
                [content_or_attributes.length == 1 ? {} : content_or_attributes.first, content_or_attributes.last || '']
              end
          end

        def delimiter_tag
          "<#{[tag_name, format_attributes].join(' ')}>"
        end

        def scope_tag
          [delimiter_tag, tag_content, "</#{tag_name}>"].join
        end
      end
    end
  end
end