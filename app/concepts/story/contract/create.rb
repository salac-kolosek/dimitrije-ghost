require "reform"
require "reform/form/dry"

module Story::Contract
  class Create < Reform::Form
    include Dry

    property :title
    property :content
    property :tag_list

  end
end