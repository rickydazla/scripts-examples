# AndSelector
# =============
#
# The `AndSelector` matches line items that matches all given selectors.
class AndSelector
  # Initializes the selector.
  #
  # Arguments
  # ---------
  #
  # * selectors
  #   The child selectors. You can pass any number of selectors.
  def initialize(*selectors)
    @selectors = selectors
  end

  # Returns whether a line item matches this selector or not.
  #
  # Arguments
  # ---------
  #
  # * line_item
  #   The item to check for matching.
  def match?(line_item)
    @selectors.all? { |selector| selector.match?(line_item) }
  end
end
