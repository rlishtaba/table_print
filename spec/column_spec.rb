require 'spec_helper'
require_relative '../lib/column'

include TablePrint

describe Column do
  let(:c) {Column.new(data: ["Once upon a time"], name: "tagline")}

  it "remembers its name" do
    c.name.should == "tagline"
  end

  it "exposes the array of data representing the column" do
    c.data.should == ['Once upon a time']
  end

  it "stores formatters" do
    f = {}
    c.add_formatter(f)
    c.formatters.should == [f]
  end

  describe "#data_width" do
    it "reflects the width of the data set" do
      c.data_width.should == 16
    end
  end

  describe "#width" do
    it "returns the specified width" do
      c.width = 14
      c.width.should == 14
    end

    it "uses the data_width if no width has been set" do
      c.width.should == 16
    end
  end
end
