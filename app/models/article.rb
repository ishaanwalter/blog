class Article < ApplicationRecord
  # include ActiveModel::Validations


  has_many :comments, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # validates_with MyValidator


end

class MyValidator < ActiveModel::Validator
  def validate(article)
    unless article.title.start_with? 'X'
      article.errors.add :title, "Need a name starting with X please!"
    end
  end
end

