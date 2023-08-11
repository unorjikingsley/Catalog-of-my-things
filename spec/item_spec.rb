require_relative '../classes/item'

RSpec.describe Item do
  let(:publish_date) { '2010-01-01' }
  let(:item) { Item.new(publish_date) }

  describe '#initialize' do
    it 'sets default values' do
      expect(item.id).to be_a(Integer)
      expect(item.publish_date).to eq(publish_date)
      expect(item.archived).to be_nil
      expect(item.genre).to be_nil
      expect(item.label).to be_nil
      expect(item.source).to be_nil
    end
  end

  describe '#add_genre' do
    it 'sets the genre' do
      item.add_genre('Sci-Fi')
      expect(item.genre).to eq('Sci-Fi')
    end
  end

  describe '#add_author' do
    it 'adds the item to the author' do
      author = double('Author', items: [])
      allow(author).to receive(:items).and_return([])

      item.add_author(author)
      expect(author.items).to include(item)
    end
  end

  describe '#add_label' do
    it 'adds the item to the label' do
      label = double('Label')
      expect(label).to receive(:add_item).with(item)

      item.add_label(label)
    end
  end

  describe '#add_source' do
    it 'adds the item to the source' do
      source = double('Source', items: [])
      allow(source).to receive(:items).and_return([])

      item.add_source(source)
      expect(source.items).to include(item)
    end
  end

  describe '#can_be_archived?' do
    context 'when publish date is over 10 years ago' do
      it 'returns true' do
        ten_years_ago = (Date.today - (10 * 365)).strftime('%Y-%m-%d')
        item = Item.new(ten_years_ago)
        expect(item.can_be_archived?).to be(false)
      end
    end

    context 'when publish date is less than 10 years ago' do
      it 'returns false' do
        nine_years_ago = (Date.today - (9 * 365)).strftime('%Y-%m-%d')
        item = Item.new(nine_years_ago)
        expect(item.can_be_archived?).to be(false)
      end
    end
  end

  describe '#move_to_archive' do
    it 'archives the item if it can be archived' do
      allow(item).to receive(:can_be_archived?).and_return(true)
      item.move_to_archive
      expect(item.archived).to be(true)
    end

    it 'does not archive the item if it cannot be archived' do
      allow(item).to receive(:can_be_archived?).and_return(false)
      item.move_to_archive
      expect(item.archived).to be_nil
    end
  end
end
