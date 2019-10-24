class Comment::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = Comment.all
  end
end