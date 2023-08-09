require_relative 'classes/book'
require_relative 'classes/label'

print 'Publisher: '
pub = gets.chomp
print 'Cover State: '
cov_s = gets.chomp
book = Book.new(pub, cov_s)

p book

print 'Title: '
title = gets.chomp
print 'Color: '
color = gets.chomp

label = Label.new(title, color)
label.add_item(book)

p label
p book