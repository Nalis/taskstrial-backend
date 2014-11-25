class Task < ActiveRecord::Base
  belongs_to :user

  def owner
    user
  end

  def owner=(owner)
    self.user = owner
  end
end
