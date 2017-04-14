class CellularAutomaton
  class OneDimensional
    attr_reader :generation

    def initialize(starting_generation, rule)
      @generation = starting_generation
      @new_generation = []
      @rule_array = sprintf('%08b', rule).split('').map(&:to_i)
    end

    def step
      generation.each.with_index do |cell, index|
        left_cell = generation[index - 1]
        right_cell = (generation[index + 1] || generation[0])

        neighborhood = [left_cell, cell, right_cell]
        @new_generation[index] = new_state(neighborhood)
      end

      @generation = @new_generation
      @new_generation = []
      @generation
    end

    private

    def new_state(neighborhood)
      case neighborhood
      when [1, 1, 1] then @rule_array[0]
      when [1, 1, 0] then @rule_array[1]
      when [1, 0, 1] then @rule_array[2]
      when [1, 0, 0] then @rule_array[3]
      when [0, 1, 1] then @rule_array[4]
      when [0, 1, 0] then @rule_array[5]
      when [0, 0, 1] then @rule_array[6]
      when [0, 0, 0] then @rule_array[7]
      end
    end
  end
end
