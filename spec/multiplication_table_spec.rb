require "./src/multiplication_table"

describe MultiplicationTable do

  before do
    @xs    = [5, 10]
    @table = MultiplicationTable.new @xs
  end

  describe "#new" do
    it "should create a multiplication table from a list of numbers" do
      expect(@table.values).to eq @xs
      expect(@table.results).to eq [[25, 50], [50, 100]]
    end
  end

  describe "#to_s" do
    it "should create a string version of a multiplication table" do
      table_as_string = [
        "    |   5  10",
        "-------------",
        "   5|  25  50",
        "  10|  50 100"
      ].join("\n")

      expect(@table.to_s).to eq table_as_string
    end
  end

  describe "#format_item" do
    it "should convert an item to a formatted string" do
      expect(MultiplicationTable.format_item 1).to eq "   1"
    end
  end

  describe "#format_row" do
    it "should convert a row to a formatted string" do
      expect(MultiplicationTable.format_row "abc", [1, 2]).to eq " abc|   1   2"
    end
  end

end
