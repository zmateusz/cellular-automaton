require 'cellular_automaton'

RSpec.describe CellularAutomaton::OneDimensional do
  let(:starting_array) { [0, 0, 0, 0, 1, 0, 0, 0, 0, 0] }

  describe '#new' do
    it 'allows to create new automaton with array' do
      expect { described_class.new(starting_array) }.to_not raise_error
    end
  end

  describe '#generation' do
    it 'returns current generation' do
      automaton = described_class.new(starting_array)
      expect(automaton.generation).to eq starting_array
    end
  end
end
