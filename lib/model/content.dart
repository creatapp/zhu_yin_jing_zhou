class Content {
  final List<String> text;
  int num = 0;

  Content(this.text);

  get numRead => this.num;
  set addNumRead (int newNum) => this.num += newNum;
  get hasReadAll => this.num >= text.length;
}