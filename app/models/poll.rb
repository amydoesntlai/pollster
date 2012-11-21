class Poll < ActiveRecord::Base
  attr_accessible :name, :admin_link
  has_many :questions

  def set_admin_link
    self.admin_link = new_link
  end

  private

  def new_link
    link = generate_random until Poll.find_by_admin_link(link) == nil
    link
  end

  def generate_random
    rand(36**10).to_s(36)
  end

end