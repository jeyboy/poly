module Poly
  module Controller
    module PaginationExtender
      protected
        def collection
          if pagination_on
            instance_variable_set "@#{configuration[:collection_name]}".to_sym, end_of_association_chain.paginate(:page => params[:page])
          end || super
        end
    end
  end
end
