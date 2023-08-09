require_relative 'spec_helper'

RSpec.describe Book do
  describe '#initialize' do
    context 'when creating a new book' do
      it 'assigns the label' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2022-01-01')
        expect(book.label).to eq('Book 1')
      end

      it 'assigns the publisher' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2022-01-01')
        expect(book.publisher).to eq('Publisher 1')
      end

      it 'assigns the cover state' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2022-01-01')
        expect(book.cover_state).to eq('Good')
      end

      it 'parses and assigns the publish date' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2022-01-01')
        expect(book.publish_date).to eq(Date.new(2022, 1, 1))
      end
    end
  end
end

RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when determining if a book can be archived' do
      it 'returns true if the cover state is bad' do
        book = Book.new('Book 1', 'Publisher 1', 'Bad', '2010-01-01')
        expect(book.can_be_archived?).to be(true)
      end

      it 'returns false if the cover state is good and publish date is within 10 years' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2022-01-01')
        expect(book.can_be_archived?).to be(false)
      end

      it 'returns true if the cover state is good and publish date is older than 10 years' do
        book = Book.new('Book 1', 'Publisher 1', 'Good', '2010-01-01')
        expect(book.can_be_archived?).to be(true)
      end
    end
  end
end
