module Poly::Dsl::HTML
  class HtmlBlock < Base
    #TODO: render not working

    TAG_WHITELIST = %w( a abbr address area article aside audio b base bdi bdo blockquote br body button canvas caption
                        cite code col colgroup command datalist dd del details dfn dialog div dl dt em embed fieldset
                        figcaption figure footer form h1 h2 h3 h4 h5 h6 head header hr html i iframe img input ins kbd
                        keygen label legend li link map mark menu meta meter nav noscript object ol optgroup option
                        output p param pre progress q rp rt ruby s samp script section select small source span strong
                        style sub summary sup table tbody td textarea tfoot th thead time title tr track u ul var video wbr
                    )

    OLD_TAG_WHITELIST = %w(acronym applet basefont big dir font frame frameset noframes strike tt)

    attr_writer :node_list
    attr_accessor :current_context

    TAG_WHITELIST.each do |method_name|
      define_method(method_name) {|*args, &block| proceed(method_name, args, &block) }
    end

    def initialize(context, &block)
      init(context)
      super(&block)
    end

    def node_list
      @node_list ||= []
    end

    def to_s
      node_list.join(' ')
    end

    def raw(text)
      node_list << text
    end

    def render(*args, &block)
      raw current_context.render(*args, &block)
    end

    #def method_missing name, *args, &block
    #  node_list << name.to_s.downcase
    #end

    protected
      def proceed(name, *args, &block)
        node_list << HtmlTag.new(current_context, name, *args, &block)
      end

      def init(context)
        current_context = context
        if Poly.old_tags_support
          OLD_TAG_WHITELIST.each do |method_name|
            define_method(method_name) {|*args, &block| proceed(method_name, args, &block) }
          end
        end
      end
  end
end