class Transaction
  def initialize(credit: nil, debit: nil, balance: nil)
    @time = Time.now
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def display
    "#{formatTime} || #{format(@credit)}|| #{format(@debit)}|| #{@balance}"
  end

  private

  def format(item)
    "#{item} " if item
  end

  def formatTime
    @time.strftime('%d/%m/%Y')
  end
end