require "rspec"
require_relative "../minefield.rb"

describe Minefield do
  describe "#sweep" do
    context "a standard 4 x 4 mine field" do
      subject { Minefield.new(field.gsub(/ +/, '')).sweep }
      let :field do
        %q(*...
           ....
           ..*.
           ....)
      end

      let :processed_field do
        %q(*100
           1211
           01*1
           0111)
      end

      it "is pretty good at counting" do
        expect(subject).to eq(processed_field.gsub(/ +/, ''))
      end
    end

    context "a tricky 4 x 4 mine field" do
      subject { Minefield.new(field).sweep }
      let :field do
        %q(*...
           ....
           ..*.
           ....)
      end

      let :processed_field do
        %q(*100
           1211
           01*1
           0111)
      end

      it "is not afraid of expanding requirements" do
        pending
        expect(subject).to eq(processed_field)
      end
    end

    context "a tricky 3 x 5 mine field" do
      subject { Minefield.new(field).sweep }
      let :field do
         %q(**...
            .....
            .*...)
      end

      let :processed_field do
         %q(**100
            33200
            1*100)
      end

      it "can put it all together" do
        pending
        expect(subject).to eq(processed_field)
      end
    end
  end
end
