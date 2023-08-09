# frozen_string_literal: true

require_relative 'handler'

# Handler class for listing all authors in the catalog.
class ListAuthorsHandler < Handler
  def initialize(authors)
    @authors = authors
  end

  def handle
    puts 'List of all authors:'
    @authors.each do |author|
      puts "#{author.id}. #{author.first_name} #{author.last_name}"
    end
  end
end
