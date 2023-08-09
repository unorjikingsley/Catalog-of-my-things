module DataSynchronizer
  def books_data
    file_name = 'books.json'
    data = JSON.parse(File.read(file_name))
    data.map do |book|
      bk = Book.new(Date.parse(book['publish_date']), book['publisher'], book['cover_state'])
      l = Label.new(book['label']['title'], book['label']['color'])
      bk.label = l
      bk
    end
  end

  def labels_data
    file_name = 'labels.json'
    data = JSON.parse(File.read(file_name))
    data.map do |label|
      Label.new(label['title'], label['color'])
    end
  end
end
