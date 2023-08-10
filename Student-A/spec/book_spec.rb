require_relative 'spec_helper'
require 'date'

RSpec.describe Book do
  describe '#initialize' do
    context 'when creating a new book' do
      date = Date.today
      it 'assigns the label' do
        book = Book.new(date, 'Publisher 1', 'Good')
        expect(book.publish_date).to eq(date)
      end

      it 'assigns the publisher' do
        book = Book.new(date, 'Publisher 1', 'Good')
        expect(book.publisher).to eq('Publisher 1')
      end

      it 'assigns the cover state' do
        book = Book.new(date, 'Publisher 1', 'Good')
        expect(book.cover_state).to eq('Good')
      end
    end
  end
end

RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when determining if a book can be archived' do
      it 'returns true if the cover state is bad' do
        book = Book.new(Date.parse('1900-01-01'), 'Publisher 1', 'bad')
        expect(book.can_be_archived?).to be(true)
      end

      it 'returns false if the cover state is good and publish date is within 10 years' do
        book = Book.new(Date.parse('1900-01-01'), 'Publisher 1', 'Good')
        expect(book.can_be_archived?).to be(true)
      end

      it 'returns true if the cover state is good and publish date is older than 10 years' do
        book = Book.new(Date.parse('1900-01-01'), 'Publisher 1', 'Good')
        expect(book.can_be_archived?).to be(true)
      end
    end
  end
end
