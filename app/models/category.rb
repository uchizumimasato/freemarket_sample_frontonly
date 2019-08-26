class Category < ApplicationRecord
  has_many :items
  has_ancestry

  def two_parent
    self.parent.parent
  end

  def one_parent
    self.parent
  end
end
