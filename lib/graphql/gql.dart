String todoDocument ="""
query {
  user(id: 1) {
    posts {
      data {
        title
      }
    }
  }
}
""";