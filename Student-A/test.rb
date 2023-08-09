require_relative './classes/book'
require_relative './classes/label'

# Create some sample data
item1 = Item.new('2010-01-01')
item1.add_genre('Fiction')
item1.add_author('John Doe')
item1.add_source('Source 1')
item1.add_label(Label.new('Label 1', 'Red'))

item2 = Item.new('2022-03-15')
item2.add_genre('Non-fiction')
item2.add_author('Jane Smith')
item2.add_source('Source 2')
item2.add_label(Label.new('Label 2', 'Blue'))

book1 = Book.new(Label.new('Label A', 'Green'), 'Publisher A', 'Good', '2005-06-20')
book1.add_genre('Horror')
book1.add_author('Stephen King')
book1.add_source('Source 3')

book2 = Book.new(Label.new('Label B', 'Yellow'), 'Publisher B', 'Bad', '2018-09-10')
book2.add_genre('Fantasy')
book2.add_author('J.K. Rowling')
book2.add_source('Source 4')

# Display the item details
puts 'Item 1:'
puts "ID: #{item1.id}"
puts "Genre: #{item1.genre}"
puts "Author: #{item1.author}"
puts "Source: #{item1.source}"
puts "Label: #{item1.label.title} (#{item1.label.color})"
puts "Publish Date: #{item1.publish_date}"
puts "Can be Archived? #{item1.move_to_archive?}"
puts '---'

# Display the book details
puts 'Book 1:'
puts "ID: #{book1.id}"
puts "Genre: #{book1.genre}"
puts "Author: #{book1.author}"
puts "Source: #{book1.source}"
puts "Label: #{book1.label.title} (#{book1.label.color})"
puts "Publisher: #{book1.publisher}"
puts "Cover State: #{book1.cover_state}"
puts "Publish Date: #{book1.publish_date}"
puts "Can be Archived? #{book1.move_to_archive?}"
puts '---'

# Create labels and add items to them
label1 = Label.new('Label A', 'Red')

label1.add_item(item1)
label1.add_item(book1)
label1.add_item(item2)
label1.add_item(book2)

# List the labels
puts 'Labels for items:'
label1.list_all_labels
