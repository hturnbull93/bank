class Transaction
  def initialize(credit: nil)
    @time = Time.now
    @credit = credit
  end

  def display
    "#{formatTime} || #{creditFormat}|| || "
  end

  private

  def creditFormat
    if @credit
      "#{@credit} "
    end
  end

  def formatTime
    @time.strftime('%d/%m/%Y')
  end
end