require_relative 'my_flatten'

RSpec.describe Array do
  context '.my_flatten' do
    # Here we are testing various cases
    # We expect that `my_flatten` will transform input into expected output
    let(:examples) do
      [
        { input: [1, [2], 3, [], [[], [4, [5]]]], output: [1, 2, 3, 4, 5] },
        { input: [], output: [] },
        { input: [[[]]], output: [] },
        { input: [[], [[]]], output: [] },
        { input: [nil], output: [nil] },
        { input: ['a', Array, [1, 2, 3]], output: ['a', Array, 1, 2, 3] },
        { 
          input: [1, [2, [3]], 'a', [], [[], 'b', ['c', [], []]]],
          output: [1, [2, [3]], 'a', [], [[], 'b', ['c', [], []]]].flatten
        }
      ]
    end

    it 'passes' do
      examples.each do |example|
        expect(example[:input].my_flatten).to eq(example[:output])
      end
    end
  end
end
