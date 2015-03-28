require 'spec_helper'

RSpec.describe Treez::DepthFirstSearch do

  subject    { described_class.new(root) }
  let(:root) { Treez::BinaryTree.new(10)}

  describe '#perform' do

    #            10
    #          /   \
    #         5     20
    #        / \    / \
    #       3  7   15 25
    #                  \
    #                  32

    let!(:nodes) do
      [root, node_5, node_3, node_7, node_20, node_15, node_25, node_32]
    end

    let(:node_5)  { root.add(5)  }
    let(:node_20) { root.add(20) }
    let(:node_3)  { root.add(3)  }
    let(:node_7)  { root.add(7)  }
    let(:node_15) { root.add(15) }
    let(:node_25) { root.add(25) }
    let(:node_32) { root.add(32) }

    it 'traverses all the nodes' do
      nodes.each do |node|
        expect(subject).to receive(:perform).with(node).ordered.and_call_original
      end
      subject.perform root
    end

    describe 'with a block' do
      let(:dummy) { [] }

      describe 'returning a a non nil' do
        let(:proc) do
          lambda do |node|
            if [5, 7].include? node.data
              dummy << node.data
            end
          end
        end

        it 'calls the block passing in the node and halt traversing' do
          subject.perform root, &proc
          expect(dummy).to eq([5])
        end
      end

      describe 'returning a falsy value' do
        let(:proc) do
          lambda do |node|
            if [5, 7].include? node.data
              dummy << node.data
            end
            false
          end
        end

        it 'calls the block passing and does not halt traversing' do
          subject.perform root, &proc
          expect(dummy).to eq([5, 7])
        end
      end
    end

  end
end
