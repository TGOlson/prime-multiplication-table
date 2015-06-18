require "./src/multiplication_table"

describe MultiplicationTable do

  before do
    @xs = [5, 10, 25]

    @table = MultiplicationTable.make_table @xs

    @table_as_string = [
      "    |   5  10  25",
      "-----------------",
      "   5|  25  50 125",
      "  10|  50 100 250",
      "  25| 125 250 625"
    ].join("\n")
  end

  describe "#make_table" do
    it "should create a multiplication table from a list of numbers" do
      expect(@table).to eq values: @xs,
                           results: [[25, 50, 125], [50, 100, 250], [125, 250, 625]]
    end
  end

  describe "#format_item" do
    it "should convert a digit to a formatted string" do
      expect(MultiplicationTable.format_item 1).to eq "   1"
    end
  end

  describe "#format_row" do
    it "should convert a row to a formatted string" do
      expect(MultiplicationTable.format_row "abc", [1, 2]).to eq " abc|   1   2"
    end
  end

  describe "#table_to_s" do
    it "should convert a multiplication table to a string" do
      expect(MultiplicationTable.table_to_s @table).to eq @table_as_string
    end
  end

  describe "#make_table_s" do
    it "should create a string version of a multiplication table" do
      expect(MultiplicationTable.make_table_s @xs).to eq @table_as_string
    end
  end

end
