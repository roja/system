require "spec_helper"

class HashLike
  def initialize(attributes={})
    @attributes = attributes
  end

  def to_h
    @attributes.to_h
  end
end

describe System::Dimensions do
  describe "#initialize" do
    context "when no arguments are given" do
      let(:instance) { described_class.new }

      it "should have correct inital attributes" do
        expect(instance.width).to eq(0)
        expect(instance.height).to eq(0)
      end
    end

    context "when an object responding to #to_h is given" do
      let(:argument) { HashLike.new(width: 123, height: 234) }
      let(:instance) { described_class.new(argument) }

      it "should update the attributes" do
        expect(instance.width).to eq(123)
        expect(instance.height).to eq(234)
      end
    end

    context "when any other object is given" do
      it "should raise an error" do
        expect { described_class.new(:foobar) }.to raise_error(NoMethodError)
      end
    end
  end

  describe "#width" do
    let(:instance) { described_class.new }
    subject { instance.width }

    it { is_expected.to eq(0) }
  end

  describe "#width=" do
    it "should set the attribute" do
      subject.width = 123

      expect(subject.width).to eq(123)
    end
  end

  describe "#height" do
    let(:instance) { described_class.new }
    subject { instance.height }

    it { is_expected.to eq(0) }
  end

  describe "#height=" do
    it "should set the attribute" do
      subject.height = 123

      expect(subject.height).to eq(123)
    end
  end

  context "conversion methods" do
    let(:instance) { described_class.new(width: 123, height: 234) }

    describe "#to_s" do
      it "should return the dimensions as a String" do
        expect(instance.to_s).to eq("123x234")
      end
    end

    describe "#to_a" do
      it "should return the dimensions as an Array" do
        expect(instance.to_a).to eq([123, 234])
      end
    end

    describe "#to_h" do
      it "should return the dimensions as a Hash" do
        expect(instance.to_h).to eq(width: 123, height: 234)
      end
    end
  end
end
