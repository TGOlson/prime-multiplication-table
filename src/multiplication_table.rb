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
    header  = format_row "", @values
    divider = header.gsub(/./, "-")
    rows    = format_rows @values, @results

    [header, divider, rows].join "\n"
  end

  def format_rows(values, results)
    values.map.with_index do |x, i|
      format_row x, results[i]
    end
  end

  def format_row(key, row)
    format_item(key) + "|" + row.map {|x| format_item x}.join
  end

  def format_item(x)
    sprintf "%4s", x
  end

end
