module MultiplicationTable

  def self.make_table(xs)
    {
      values: xs,

      # O(n^2)
      results: xs.map {|x| xs.map {|y| y * x}}
    }
  end

  def self.table_to_s(table)
    header = format_row "", table[:values]

    divider = header.gsub(/./, "-")

    # O(n^2)
    rows = table[:values].map.with_index do |x, i|
      format_row x, table[:results][i]
    end

    [header, divider, rows].join "\n"
  end

  def self.format_row(key, row)
    format_item(key) + "|" + row.map {|y| format_item y}.join
  end

  def self.format_item(x)
    sprintf "%4s", x
  end

  def self.make_table_s(xs)
    table_to_s make_table(xs)
  end

end
