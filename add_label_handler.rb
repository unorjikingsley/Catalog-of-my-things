# frozen_string_literal: true

require_relative 'handler'
require_relative 'label'

# Handler class for adding a label to the catalog.
class AddLabelHandler < Handler
  def initialize(labels)
    @labels = labels
  end

  def handle
    puts 'Enter Label Title:'
    label_title = gets.chomp

    puts 'Enter Label Color:'
    label_color = gets.chomp

    id = @labels.empty? ? 1 : @labels.last.id + 1
    label = Label.new(id, label_title, label_color)
    @labels << label

    puts "Label '#{label_title}' added successfully!"
  end
end
