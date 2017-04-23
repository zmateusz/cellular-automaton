require_relative 'cellular_automaton/one_dimensional'

class StringFormatter
  def initialize(rule:)
    @rule = rule
    @result = ''
  end

  def call
    array = Array.new(100) { 0 }
    array[49] = 1
    one, zero = '█', ' '
    append_to_result = lambda { |cell| @result += (cell == 0 ? zero : one) }

    ca = CellularAutomaton::OneDimensional.new(array, @rule)
    ca.generation.each(&append_to_result)
    @result += "\n"

    100.times do
      ca.step.each(&append_to_result)
      @result += "\n"
    end

    @result
  end
end
