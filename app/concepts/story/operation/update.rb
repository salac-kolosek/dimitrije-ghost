class Story::Update < Trailblazer::Operation
	
  step Model(Story, :find_by)
  step :set_owner
  step Contract::Build( constant: Story::Contract::Create )
  step Contract::Validate( key: :story )
  step Contract::Persist()

  def set_owner(options, params, *)
  	byebug
  	options["model"].owner_id =  options["current_user"].id
  end

end