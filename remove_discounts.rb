# RemoveDiscounts
# ===============
#
# The `RemoveDiscounts` removes discounts from item prices.
#
# Example
# -------
#   * Discounts not applicable
#
class RemoveDiscounts

  # Initializes the discount.
  #
  # Arguments
  # ---------
  #
  # * message
  #   The message to show for the discount.
  #
  def initialize(message)
    @message = message
  end

  # Removes discounts from line item.
  #
  # Arguments
  # ---------
  #
  # * line_item
  #   The item from which the discounts will be removed.
  #
  # Example
  # -------
  # Given `RemoveDiscounts.new("Discounts not applicable")` and $100 item with 50% off coupon code applied:
  #
  # The campaign will removed 50% off discount, for $100 original price.
  #
  def apply(line_item)
    # Reset discounted line price
    new_line_price = line_item.line_price_was

    # Apply the new/reset line price to this line item with given message
    # describing the reason, which may be displayed in cart pages and
    # confirmation emails to describe the applied adjustment.
    line_item.change_line_price(new_line_price, message: @message)

    # Print a debugging line to the console
    puts "Reset line item with variant #{line_item.variant.id}."
  end
end
