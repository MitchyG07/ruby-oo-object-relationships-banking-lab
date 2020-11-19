#require_relative '../lib/bank_account'
require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = 'pending'
    @amount = 50 
  end 

  def valid?
    self.sender.valid? && self.receiver.valid? 
  end 
end
