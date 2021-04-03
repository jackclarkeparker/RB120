# Consider the following broken code:

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin

Modify this code so it works.
Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.

PEDAC

### EXPLICIT

- Code is broken, we've got to modify it to fix it
- Amount of money in wallet must remain inaccessible outside of the wallet class

### IMPLICIT

- Wallet uses comparable module
- spaceship operator is defined to compare @amount instance variable between two
  Wallet objects.
- THere is not getter method for retrieving @amount.
  ===> We've got to make this method, and we want it to be protected
         - Protected so that the method can be called on other instance of the
           class from within the class, but totally inaccessible from outside
           the class.


=end