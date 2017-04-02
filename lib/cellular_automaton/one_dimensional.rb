class CellularAutomaton
  class OneDimensional
    attr_reader :generation

    def initialize(starting_generation)
      @generation = starting_generation
      @new_generation = []
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
      # rule 30
      case neighborhood
      when [1, 1, 1] then 0
      when [1, 1, 0] then 0
      when [1, 0, 1] then 0
      when [1, 0, 0] then 1
      when [0, 1, 1] then 1
      when [0, 1, 0] then 1
      when [0, 0, 1] then 1
      when [0, 0, 0] then 0
      end
    end
  end
end
