# frozen_string_literal: true

require "spec_helper"

describe Mongoid::Matchable::Gte do

  describe "#_matches?" do

    context "when the value is larger" do

      let(:matcher) do
        described_class.new(5)
      end

      it "returns true" do
        expect(matcher._matches?("$gte" => 3)).to be true
      end
    end

    context "when the value is smaller" do

      let(:matcher) do
        described_class.new(5)
      end

      it "returns false" do
        expect(matcher._matches?("$gte" => 10)).to be false
      end
    end

    context "when the value is equal" do

      let(:matcher) do
        described_class.new(5)
      end

      it "returns true" do
        expect(matcher._matches?("$gte" => 5)).to be true
      end
    end

    context "when the value is nil" do

      let(:matcher) do
        described_class.new(nil)
      end

      it "returns false" do
        expect(matcher._matches?("$gte" => 5)).to be false
      end
    end

    context "when the value is an array" do
      context "there are value valid" do
        let(:matcher) do
          described_class.new([6,4])
        end

        it "returns false" do
          expect(matcher._matches?("$gte" => 5)).to be true
        end
      end

      context "there are not value valid" do
        let(:matcher) do
          described_class.new([3,4])
        end

        it "returns false" do
          expect(matcher._matches?("$gte" => 5)).to be false
        end
      end
    end

    context "when the value is not numeric" do

      let(:matcher) do
        described_class.new(5)
      end

      it "returns false" do
        expect(matcher._matches?("$gte" => '4.9')).to be false
      end
    end
  end
end
