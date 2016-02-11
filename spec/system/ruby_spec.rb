require "spec_helper"

RSpec.shared_examples "a System::Ruby class method" do |method_name|
  const_name = "RUBY_#{method_name.upcase}"

  describe ".#{method_name}" do
    subject { described_class.send(method_name) }

    context "when the constant is defined" do
      before { Object.const_set(const_name, "Foobar") }

      it { is_expected.to eq("Foobar") }
    end

    context "when the constant is undefined" do
      before { Object.send(:remove_const, const_name) if Object.const_defined?(const_name) }

      it { is_expected.to eq(nil) }
    end
  end

  describe ".#{method_name}?" do
    subject { described_class.send("#{method_name}?") }

    context "when the constant is defined" do
      before { Object.const_set(const_name, "Foobar") }

      it { is_expected.to eq(true) }
    end

    context "when the constant is undefined" do
      before { Object.send(:remove_const, const_name) if Object.const_defined?(const_name) }

      it { is_expected.to eq(false) }
    end
  end
end

# TODO: platform and interpreter specific tests
describe System::Ruby do
  it_behaves_like "a System::Ruby class method", "copyright"
  it_behaves_like "a System::Ruby class method", "description"
  it_behaves_like "a System::Ruby class method", "engine"
  it_behaves_like "a System::Ruby class method", "patchlevel"
  it_behaves_like "a System::Ruby class method", "platform"
  it_behaves_like "a System::Ruby class method", "revision"
  it_behaves_like "a System::Ruby class method", "release_date"
  it_behaves_like "a System::Ruby class method", "version"

  describe "#name" do
    subject { described_class.name }

    context "when RUBY_ENGINE is nil" do
      before { Object.send(:remove_const, :RUBY_ENGINE) if Object.const_defined?(:RUBY_ENGINE) }

      it { is_expected.to eq(nil) }
    end

    context "when RUBY_ENGINE is not nil" do
      context "and it is 'ruby'" do
        before { Object.const_set(:RUBY_ENGINE, "ruby") }

        it { is_expected.to eq(:ruby) }
      end

      context "and it is 'mruby'" do
        before { Object.const_set(:RUBY_ENGINE, "mruby") }

        it { is_expected.to eq(:mruby) }
      end

      context "and it is 'jruby'" do
        before { Object.const_set(:RUBY_ENGINE, "jruby") }

        it { is_expected.to eq(:jruby) }
      end

      context "and it is 'rbx'" do
        before { Object.const_set(:RUBY_ENGINE, "rbx") }

        it { is_expected.to eq(:rubinius) }
      end

      context "and it is 'maglev'" do
        before { Object.const_set(:RUBY_ENGINE, "maglev") }

        it { is_expected.to eq(:maglev) }
      end
    end
  end

  describe "#language" do
    subject { described_class.language }

    context "when RUBY_ENGINE is nil" do
      before { Object.send(:remove_const, :RUBY_ENGINE) if Object.const_defined?(:RUBY_ENGINE) }

      it { is_expected.to eq(nil) }
    end

    context "when RUBY_ENGINE is not nil" do
      context "and it is 'ruby'" do
        before { Object.const_set(:RUBY_ENGINE, "ruby") }

        it { is_expected.to eq(:c) }
      end

      context "and it is 'mruby'" do
        before { Object.const_set(:RUBY_ENGINE, "mruby") }

        it { is_expected.to eq(:c) }
      end

      context "and it is 'jruby'" do
        before { Object.const_set(:RUBY_ENGINE, "jruby") }

        it { is_expected.to eq(:java) }
      end

      context "and it is 'rbx'" do
        before { Object.const_set(:RUBY_ENGINE, "rbx") }

        it { is_expected.to eq(:cpp) }
      end

      context "and it is 'maglev'" do
        before { Object.const_set(:RUBY_ENGINE, "maglev") }

        it { is_expected.to eq(:smalltalk) }
      end
    end
  end
end
