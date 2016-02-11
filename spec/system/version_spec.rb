require "spec_helper"

describe System do
  describe "VERSION constant" do
    subject { System::VERSION }
    let(:expectation) { Pathname.new(__FILE__).join("..", "..", "..", "VERSION").read.strip }

    it { is_expected.to eq(expectation) }
  end
end
