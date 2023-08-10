require_relative 'spec_helper'

RSpec.describe Label do
  describe '#initialize' do
    context 'when creating a new label' do
      it 'assigns a random ID' do
        label = Label.new('Label 1', 'Red')
        expect(label.id).to be_an(Integer)
      end

      it 'assigns the title' do
        label = Label.new('Label 1', 'Red')
        expect(label.title).to eq('Label 1')
      end

      it 'assigns the color' do
        label = Label.new('Label 1', 'Red')
        expect(label.color).to eq('Red')
      end
    end
  end
end

RSpec.describe Label do
  describe '#add_item' do
    context 'when adding an item' do
      it 'adds the item to the label' do
        label = Label.new('Label 1', 'Red')
        item = Item.new('2022-01-01')
        label.add_item(item)
        expect(label.items).to include(item)
      end

      it 'sets the label of the item' do
        label = Label.new('Label 1', 'Red')
        item = Item.new('2022-01-01')
        label.add_item(item)
        expect(item.label).to eq(label)
      end
    end
  end
end
