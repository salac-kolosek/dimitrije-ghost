require_relative "../contract/create"

class Comment::Create < Trailblazer::Operation

	step Model(Comment, :new)
	step Contract::Build( constant: Comment::Contract::Create )
	step :set_story_id
	step Contract::Validate(key: :comment )
    step Contract::Persist()

    def set_story_id(options, params, *)
    	options["model"].story_id = 1
    end

end