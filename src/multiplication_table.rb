require 'contracts'


class MultiplicationTable
  include Contracts

  attr_reader :values, :results

  # Contract ArrayOf[Num] => MultiplicationTable
  # Doesn't seem like there is a good way to provide instance contracts
  def initialize(xs)
    @values  = xs
    @results = MultiplicationTable.calculate_results xs
  end

  Contract None => String
  def to_s
    MultiplicationTable.format_table self
  end

  Contract ArrayOf[Num] => ArrayOf[ArrayOf[Num]]
  def self.calculate_results(xs)
    xs.map {|x| xs.map {|y| x * y}}
  end

  Contract MultiplicationTable => String
  def self.format_table(table)
    header  = format_row "", table.values
    divider = header.gsub(/./, "-")
    rows    = format_rows table.values, table.results

    [header, divider, rows].join "\n"
  end

  Contract ArrayOf[Num], ArrayOf[ArrayOf[Num]] => ArrayOf[String]
  def self.format_rows(values, results)
    values.map.with_index do |x, i|
      format_row x, results[i]
    end
  end

  Contract Any, ArrayOf[Num] => String
  def self.format_row(key, row)
    format_item(key) + "|" + row.map {|x| format_item x}.join
  end

  Contract Any => String
  def self.format_item(x)
    sprintf "%4s", x
  end

end
