enum ProductFilters {
  newest(
    value: 'newest',
    title: 'Newest',
  ),
  oldest(
    value: 'oldest',
    title: 'Oldest',
  ),
  priceLow(
    value: 'priceLow',
    title: 'Price low > high',
  ),
  priceHigh(
    value: 'priceHigh',
    title: 'Price high > low',
  ),
  bestSelling(
    value: 'bestSelling',
    title: 'Best selling',
  );

  const ProductFilters({
    required this.value,
    required this.title,
  });

  final String value;
  final String title;
}
