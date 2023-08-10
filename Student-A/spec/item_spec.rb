require_relative 'spec_helper'
require 'date'

RSpec.describe Item do
  describe '#initialize' do
    context 'when creating a new item' do
      today = Date.today
      it 'assigns a random ID' do
        item = Item.new(today)
        expect(item.id).to be_an(Integer)
      end

      it 'parses and assigns the publish date' do
        item = Item.new(today)
        expect(item.publish_date).to eq(today)
      end

      it 'assigns archived as true by default' do
        item = Item.new(today)
        expect(item.instance_variable_get(:@archived)).to be(true)
      end

      it 'assigns the archived flag when specified' do
        item = Item.new(today, archived: false)
        expect(item.instance_variable_get(:@archived)).to be(false)
      end
    end
  end
end

RSpec.describe Item do
  today = Date.today
  describe '#add_genre' do
    context 'when adding a genre' do
      it 'assigns the genre' do
        item = Item.new(today)
        item.add_genre('Fiction')
        expect(item.genre).to eq('Fiction')
      end
    end
  end

  describe '#add_author' do
    context 'when adding an author' do
      it 'assigns the author' do
        item = Item.new(today)
        item.add_author('John Doe')
        expect(item.author).to eq('John Doe')
      end
    end
  end
end

RSpec.describe Item do
  today = Date.today
  describe '#add_label' do
    context 'when adding a label' do
      it 'assigns the label' do
        item = Item.new(today)
        item.add_label('Book 1')
        expect(item.label).to eq('Book 1')
      end
    end
  end

  describe '#add_source' do
    context 'when adding a source' do
      it 'assigns the source' do
        item = Item.new(today)
        item.add_source('Library')
        expect(item.source).to eq('Library')
      end
    end
  end
end

RSpec.describe Item do
  today = Date.today
  describe '#move_to_archive?' do
    context 'when moving to the archive' do
      it 'updates the archived flag' do
        item = Item.new(today)
        item.move_to_archive?
        expect(item.instance_variable_get(:@archived)).to be(false)
      end
    end
  end
end
