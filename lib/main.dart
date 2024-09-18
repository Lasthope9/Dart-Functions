void main() {
  // Sample item prices
  List<double> prices = [6.99, 14.49, 28.00, 11.99, 13.50];

  // Calculate the total price
  double total = calculateTotal(prices, tax: 0.07); // 7% tax

  // Apply discount
  double discountedTotal = applyDiscount(prices, (price) => price * 0.9); // 10% discount

  // Calculate the factorial discount
  double factorialDiscount = calculateFactorialDiscount(prices.length);

  // Apply the factorial discount
  double finalPrice = discountedTotal * (1 - factorialDiscount / 100);

  print("Original Prices: $prices");
  print("Total with Tax: \$${total.toStringAsFixed(2)}");
  print("Discounted Total: \$${discountedTotal.toStringAsFixed(2)}");
  print("Factorial Discount: ${factorialDiscount.toStringAsFixed(2)}%");
  print("Final Price After Factorial Discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double subtotal = prices.fold(0.0, (sum, price) => sum + price);
  return subtotal * (1 + tax);
}

// Function to apply a discount using a higher-order function
double applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).fold(0.0, (sum, price) => sum + price);
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int number) {
  if (number == 0 || number == 1) {
    return 1.0;
  }
  return number * calculateFactorialDiscount(number - 1);
}

