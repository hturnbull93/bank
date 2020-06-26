# frozen_string_literal: true

module Conversion
  def to_pence(amount)
    (amount * 100).to_i
  end

  def as_pounds(amount)
    '%.2f' % (amount.to_f / 100)
  end
end
