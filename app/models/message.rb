class Message < ApplicationRecord
  before_save :setup_key

  private

  def setup_key
    self.key = rand(36**8).to_s(36)
  end
end
