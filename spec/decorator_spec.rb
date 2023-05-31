require_relative '../nameable'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('Nameable') }
  subject { Decorator.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name on the decorated object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end
end
