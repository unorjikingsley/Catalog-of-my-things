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

      it 'assigns an ID when specified' do
        label = Label.new('Label 1', 'Red', id: 123)
        expect(label.id).to eq(123)
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

  describe '#list_all_labels' do
    context 'when listing all labels' do
      it 'returns a string of unique label titles' do
        label = Label.new('Label 1', 'Red')
        item1 = Item.new('2022-01-01')
        item2 = Item.new('2022-02-01')
        item3 = Item.new('2022-03-01')
        label.add_item(item1)
        label.add_item(item2)
        label.add_item(item3)

        expect { label.list_all_labels }.to output('Label 1').to_stdout
      end
    end
  end
end

RSpec.describe Label do
  describe '#list_all_labels' do
    context 'when listing all labels' do
      it 'returns a string of unique label titles' do
        label = Label.new('Label 1', 'Red')
        item1 = Item.new('2022-01-01')
        item2 = Item.new('2022-02-01')
        item3 = Item.new('2022-03-01')
        label.add_item(item1)
        label.add_item(item2)
        label.add_item(item3)

        expect { label.list_all_labels }.to output('Label 1').to_stdout
      end
    end
  end
end
