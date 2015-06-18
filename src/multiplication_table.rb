module MultiplicationTable

  def self.make_table(xs)
    {
      values: xs,

      # O(n^2)
      results: xs.map {|x| xs.map {|y| y * x}}
    }
  end

  def self.table_to_s(table)
    header = "_|" + table[:values].join('|')

    # O(n^2)
    rows = table[:values].map.with_index do |x, i|
      "#{x}| " + table[:results][i].join(" ")
    end

    [header, rows].join "\n"
  end

  def self.make_table_s(xs)
    table_to_s make_table(xs)
  end

end
