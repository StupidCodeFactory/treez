require 'spec_helper'

RSpec.describe Treez::BinaryTree do
  subject { described_class.new(10) }

  describe '#initialize' do
    it 'takes an argument' do
      expect { subject }.to_not raise_error
    end
  end

  describe '#add' do
    let!(:new_node) { subject.add data }

    describe 'with a smaller data' do
      let(:data) { 1 }

      it 'add a node to the left subtree' do
        expect(subject.left.data).to eq(1)
      end

      it 'returns the new node' do
        expect(new_node.data).to eq(data)
      end

      it 'has the correct parent' do
        expect(new_node.parent).to eq(subject)
      end

      describe 'subtree' do
        let!(:subtree_node) { subject.add sub_data }

        describe 'with a smaller value then its left node' do
          let(:sub_data) { 0 }

          it 'creates a sbutree on the left' do
            expect(subject.left.left.data).to eq(sub_data)
          end
        end

        describe 'with a value between self and left node' do
          let(:sub_data) { 5 }

          it 'creates a sbutree on the right' do
            expect(subject.left.right.data).to eq(sub_data)
          end
        end

      end
    end

    describe 'with a bigger data' do
      let(:data) { 20 }

      it 'add a node to the right subtree' do
        expect(subject.right.data).to eq(20)
      end

      it 'returns the new node' do
        expect(new_node.data).to eq(data)
      end

      it 'has the correct parent' do
        expect(new_node.parent).to eq(subject)
      end

      describe 'subtree' do
        let!(:subtree_node) { subject.add sub_data }

        describe 'with a bigger value then its right node' do
          let(:sub_data) { 25 }

          it 'creates a sbutree on the right' do
            expect(subject.right.right.data).to eq(sub_data)
          end

          it 'returns the new node' do
            expect(subtree_node.data).to eq(25)
          end
        end

        describe 'with a value between self and right node' do
          let(:sub_data) { 15 }

          it 'creates a sbutree on the left' do
            expect(subject.right.left.data).to eq(sub_data)
          end

          it 'returns the new node' do
            expect(subtree_node.data).to eq(15)
          end

        end

      end
    end

    describe 'with an equal valule' do
      let(:data) { 10 }

      it 'returns the same node' do
        expect(new_node).to eq(subject)
      end

    end

  end

end
