class DeleteMemberWorker
  include Sidekiq::Worker

  def perform(user)
    user.destroy
  end
end
