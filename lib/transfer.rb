#require_relative '../lib/bank_account'
require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = 'pending'
    @amount = amount
  end 

  def execute_transaction 
      if self.status == "pending" && valid? && self.sender.balance >= self.amount
        self.receiver.balance += amount 
        self.sender.balance -= amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
  end 

  def valid?
    self.sender.valid? && self.receiver.valid? 
  end

end
