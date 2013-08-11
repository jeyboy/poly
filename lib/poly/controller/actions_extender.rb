module Poly
  module Controller
    module ActionsExtender
      # Override the InheritedResources actions to use the templates.
      #
      # We ensure that the functionality provided by Inherited
      # Resources is still available within any ResourceController

      def index(options={}, &block)
        super(options) do |format|
          block.call(format) if block
          format.html { render presentations[:index] }
          format.csv do
            headers['Content-Type'] = 'text/csv; charset=utf-8'
            headers['Content-Disposition'] = %{attachment; filename="#{csv_filename}"}
            render active_admin_template('index')
          end
        end
      end
      alias :index! :index

      def show(options={}, &block)
        #super do |format|
        super(options) do |format|
          block.call(format) if block
          format.html { render presentations[:show] }
        end
      end
      alias :show! :show

      def new(options={}, &block)
        #super do |format|
        super(options) do |format|
          block.call(format) if block
          format.html { render presentations[:new] }
        end
      end
      alias :new! :new

      def edit(options={}, &block)
        #super do |format|
        super(options) do |format|
          block.call(format) if block
          format.html { render presentations[:edit] }
        end
      end
      alias :edit! :edit

      def create(options={}, &block)
        super(options) do |success, failure|
          block.call(success, failure) if block
          failure.html { render presentations[:new] }
        end
      end
      alias :create! :create

      def update(options={}, &block)
        #super do |success, failure|
        super(options) do |success, failure|
          block.call(success, failure) if block
          failure.html { render presentations[:edit] }
        end
      end
      alias :update! :update

      # Make aliases protected
      protected :index!, :show!, :new!, :create!, :edit!, :update!
    end
  end
end
