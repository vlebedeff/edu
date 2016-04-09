require 'spec_helper'

module Edu
  describe UndirectedGraph do
    subject { build(:graph_3_1) }

    specify '#each_vertex' do
      expect(subject.each_vertex.to_a).to eq(%w(A B C D E F G H I))
    end

    specify '#each_adjacent' do
      expect(subject.each_adjacent('A').to_a).to eq(%w(B E))
      expect(subject.each_adjacent('B').to_a).to eq(%w(A C E))
      expect(subject.each_adjacent('C').to_a).to eq(%w(B F))
      expect(subject.each_adjacent('D').to_a).to eq(%w(G H))
      expect(subject.each_adjacent('E').to_a).to eq(%w(A B F))
      expect(subject.each_adjacent('F').to_a).to eq(%w(C E I))
      expect(subject.each_adjacent('G').to_a).to eq(%w(D H))
      expect(subject.each_adjacent('H').to_a).to eq(%w(D G))
      expect(subject.each_adjacent('I').to_a).to eq(%w(F))
    end
  end
end
