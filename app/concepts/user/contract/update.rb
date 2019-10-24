require "reform"
require "reform/form/dry"

module User::Contract
  class Update < Reform::Form
    include Dry

    property :full_name
    property :slug
    property :email
    property :bio
    property :avatar
    property :role

  end
end