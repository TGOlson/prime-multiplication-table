require "./src/multiplication_table"

describe MultiplicationTable do

  before do
    @xs = [2, 3]

    @table = MultiplicationTable.make_table @xs

    @table_as_string = [
      "_|2|3",
      "2| 4 6",
      "3| 6 9"
    ].join("\n")
  end

  describe "#make_table" do
    it "should create a multiplication table from a list of numbers" do
      expect(@table).to eq values: @xs,
                           results: [[4, 6], [6, 9]]
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
