class Printer
  def print(item)
    puts item.kind_of?(String) ? item : item.join("\n")
  end
end
