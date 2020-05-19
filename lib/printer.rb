# frozen_string_literal: true

class Printer
  def print(item)
    puts item.is_a?(String) ? item : item.join("\n")
  end
end
