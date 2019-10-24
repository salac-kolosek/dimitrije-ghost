require "reform"
require "reform/form/dry"

module Comment::Contract
  class Create < Reform::Form
    include Dry

    property :content

  end
end