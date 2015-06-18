class MultiplicationTable

  attr_reader :values, :results

  def initialize(xs)
    @values  = xs
    @results = calculate_results xs
  end

  def calculate_results(xs)
    xs.map {|x| xs.map {|y| x * y}}
  end

  def to_s
    MultiplicationTable.format_table self
  end

  def self.format_table(table)
    header  = format_row "", table.values
    divider = header.gsub(/./, "-")
    rows    = format_rows table.values, table.results

    [header, divider, rows].join "\n"
  end

  def self.format_rows(values, results)
    values.map.with_index do |x, i|
      format_row x, results[i]
    end
  end

  def self.format_row(key, row)
    format_item(key) + "|" + row.map {|x| format_item x}.join
  end

  def self.format_item(x)
    sprintf "%4s", x
  end

end
