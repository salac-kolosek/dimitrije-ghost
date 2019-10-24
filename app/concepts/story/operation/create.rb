class Story::Create < Trailblazer::Operation

	attr_reader :current_user
	
  step Model(Story, :new)
  step :set_owner
  step Contract::Build( constant: Story::Contract::Create )
  step Contract::Validate( key: :story )
  step Contract::Persist()

  def set_owner(options, params, *)
  	options["model"].owner_id =  options["current_user"].id
  end

end