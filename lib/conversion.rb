module Conversion
  def to_pence(amount)
    (amount * 100).to_i
  end

  def as_pounds(amount)
    sprintf "%.2f", amount / 100
  end
end