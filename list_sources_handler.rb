# frozen_string_literal: true

require_relative 'handler'

# Handler class for listing all sources in the catalog.
class ListSourcesHandler < Handler
  def initialize(sources)
    @sources = sources
  end

  def handle
    puts 'List of all sources:'
    @sources.each do |source|
      puts "#{source.id}. #{source.name}"
    end
  end
end
