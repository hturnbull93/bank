class Transaction
  def initialize(credit: nil, debit:nil)
    @time = Time.now
    @credit = credit
    @debit = debit
  end

  def display
    "#{formatTime} || #{creditFormat}|| #{debitFormat}|| "
  end

  private

  def creditFormat
    if @credit
      "#{@credit} "
    end
  end

  def debitFormat
    if @debit
      "#{@debit} "
    end
  end

  def formatTime
    @time.strftime('%d/%m/%Y')
  end
end