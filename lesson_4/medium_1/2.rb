# Alan created the following code to keep track of
# items for a shopping cart application he's writing:

Copy Code
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin

Alyssa looked at the code and spotted a mistake.
"This will fail when update_quantity is called",
she says.

Can you spot the mistake and how to address it?

#####

The code in `update_quantity` attempts to reassign the
`quantity` attribute when conditional suffix evaluates
truthily.

This goes awry however, because without prepending an `@`
to reference the instance variable, or `self.` to reference
a quantity setter method (assuming one was created)
`quantity` the line of code actually becomes local
variable initialization.

To fix the code, we can prepend quantity with @, or,
perhaps a better solution is to define a setter method
for `quantity` and use this to reassign the attribute.


=end