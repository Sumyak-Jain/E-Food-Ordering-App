class items {
  String price, quantity, title;

  items(this.price, this.quantity, this.title);

  @override
  String toString() {
    return '{ ${this.price}, ${this.quantity},${this.title} }';
  }
}
