class User::Update < Trailblazer::Operation
	
  step Model(User, :find_by)
  step Contract::Build( constant: User::Contract::Update )
  step Contract::Validate( key: :user )
  step Contract::Persist()

end