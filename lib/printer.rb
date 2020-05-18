class Printer
  def print(item)
    if item.kind_of?(String)
      puts item
    else
      puts item.join("\n")
    end
  end
end
