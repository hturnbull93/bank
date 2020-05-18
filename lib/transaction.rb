class Transaction
  def initialize
    @time = Time.now
  end

  def display
    "#{formatTime} || || || "
  end

  private

  def formatTime
    @time.strftime('%d/%m/%Y')
  end
end