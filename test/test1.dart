void main() {
  var list = [{"a": 1}, {"a":2}];
  var cc = list.map((item) {
    return {
      "c": item["a"]
    };
  });

  print(cc.toList());
}
