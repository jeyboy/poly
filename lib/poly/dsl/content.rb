module Poly
  module Dsl
    class Content < Base
      TAG_WHITELIST = %w( a abbr address area article aside audio b base bdi bdo blockquote br body button canvas caption
                          cite code col colgroup command datalist dd del details dfn dialog div dl dt em embed fieldset
                          figcaption figure footer form h1 h2 h3 h4 h5 h6 head header hr html i iframe img input ins kbd
                          keygen label legend li link map mark menu meta meter nav noscript object ol optgroup option
                          output p param pre progress q rp rt ruby s samp script section select small source span strong
                          style sub summary sup table tbody td textarea tfoot th thead time title tr track u ul var video wbr
                      )

      OLD_TAG_WHITELIST = %w(acronym applet basefont big dir font frame frameset noframes strike tt)

      attr_writer :node_list

      TAG_WHITELIST.each do |method_name|
        define_method(method_name) {|*args, &block| proceed(method_name, *args, &block) }
      end

      def node_list
        @node_list ||= []
      end

      def to_s
        node_list.join(' ')
      end

      #def method_missing name, *args, &block
      #  str_name = name.to_s.downcase
      #  if TAG_WHITELIST.include?(str_name)
      #    proceed(str_name, *args, &block)
      #  end
      #end

      protected
        def proceed(name, *args, &block)
          node_list << HtmlTag.new(name, *args, &block)
        end
    end
  end
end