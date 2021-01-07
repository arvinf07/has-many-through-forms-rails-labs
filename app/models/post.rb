class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes=(hash_of_attr)
    hash_of_attr.values.each do |category_attr|
      unless category_attr[:name].blank?
        category = Category.find_or_create_by(category_attr)
        self.post_categories.build(category: category)
      end  
    end  
  end  


end
