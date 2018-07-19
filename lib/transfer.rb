require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  # your code here
  def initialize(sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !sender.valid?
      self.status = "rejected"
    elsif @status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
   end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
    "rejected"
    end
  end


end
