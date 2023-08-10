module DisplayLabels
  def display_labels
    puts '-----------------------------------------------'
    if @labels.empty?
      puts 'No labels yet found, Feel free to add labes'
    else
      puts 'Labels: '
      @labels.each_with_index do |label, index|
        puts "#{index}) title: '#{label.title}', color: '#{label.color}'"
      end
    end
    puts '------------------------------------------------'
  end
end
