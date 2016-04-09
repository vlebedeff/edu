require 'spec_helper'

module Edu
  describe DFSVisitor do
    subject { described_class.new(build(:graph_3_1)) }

    it 'can count pre & post numbers' do
      clock = 0
      steps = {}

      subject.previsit { |vertex| steps[vertex] = { pre: clock += 1 } }
      subject.postvisit { |vertex| steps[vertex][:post] = clock += 1 }
      subject.run

      expect(steps['A']).to eq({ pre: 1, post: 12 })
      expect(steps['B']).to eq({ pre: 2, post: 11 })
      expect(steps['C']).to eq({ pre: 3, post: 10 })
      expect(steps['F']).to eq({ pre: 4, post: 9 })
      expect(steps['E']).to eq({ pre: 5, post: 6 })
      expect(steps['I']).to eq({ pre: 7, post: 8 })
      expect(steps['D']).to eq({ pre: 13, post: 18 })
      expect(steps['G']).to eq({ pre: 14, post: 17 })
      expect(steps['H']).to eq({ pre: 15, post: 16 })
    end
  end
end
