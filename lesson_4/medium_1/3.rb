# In the last question Alan showed Alyssa this code which
# keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin

Alyssa noticed that this will fail when update_quantity
is called. Since quantity is an instance variable,
it must be accessed with the @quantity notation when
setting it. One way to fix this is to change attr_reader
to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?

#####

One possible issue with solving this problem by changing
the attr_reader into an attr_accessor is that you will
be exposing `quantity` and `product_name` such that
they can not only be referenced, but actually altered
from outside of the class.

If you wished to prevent this exposure, another way of
doing this would be to invoke an attr_writer for
`quantity` following a keyword `private`

(
LS makes the additional point that it means that the
protections built into the `update_quantity` method
can be circumvented which could potentially pose
problems further down the line.

This seems to be a good point; adding a public setter
for an attribute that has controls around how
it is modified is a good example of a bad idea!
)

=end