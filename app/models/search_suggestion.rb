class SearchSuggestion < ApplicationRecord
  scope :terms_for, -> (prefix) { where("term LIKE ?", "#{prefix}_%").order("popularity desc").limit(10).pluck(:term) }

  def self.index_products
    Story.find_each do |story|
      index_term(story.title)
      story.title.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_create.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
