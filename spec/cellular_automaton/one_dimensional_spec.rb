require 'cellular_automaton'

RSpec.describe CellularAutomaton::OneDimensional do
  let(:starting_array) { [0, 0, 0, 0, 1, 0, 0, 0, 0, 0] }
  let(:rule) { 30 }
  let(:automaton) { described_class.new(starting_array, rule) }

  describe '#new' do
    it 'allows to create new automaton with array' do
      expect { automaton }.to_not raise_error
    end
  end

  describe '#generation' do
    it 'returns current generation' do
      expect(automaton.generation).to eq starting_array
    end
  end

  describe '#step' do
    it 'returns new generation' do
      new_generation = [0, 0, 0, 1, 1, 1, 0, 0, 0, 0]

      expect(automaton.step).to eq(new_generation)
    end
  end
end
