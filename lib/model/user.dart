class User {
  String username = '';
  String email = '';
  String avatar = '';

  User() {}

  User.empty();

  Future<void> initData() async {
    username = 'Baro Vinh';
    email = 'pv198357@gmail.com';
    avatar =
        'https://scontent.fsgn5-7.fna.fbcdn.net/v/t39.30808-1/774924894_2513823135785404_1685293347131867586_n.jpg?stp=dst-jpg_tt6&cstp=mx1920x1933&ctp=s200x200&_nc_cat=111&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=1d2534&_nc_eui2=AeFIi3WetZmxlKq0D_FvXaLwRNG9kl5FJBpE0b2SXkUkGnWA3gM-Yphe_7yXIWSv0tjPdhbUB8QJhS3LKHhQaFqG&_nc_ohc=hos8EeCMTWQQ7kNvwGr3YQQ&_nc_oc=AdovcVwXIZyYHrDXHvsStt3Gr7uxryEeYE_4hHTvDbGqlw9X9j6JPc2fJZ_7FePk8Gg&_nc_zt=24&_nc_ht=scontent.fsgn5-7.fna&_nc_gid=TURv7zAHrgf6kiGXuQB26A&_nc_ss=7b2a8&oh=00_AQFjFQ7dT3sHbMeLyRUwabEQuVi_fLFXQOIizv1zXZf7Gw&oe=6A8B39CA';
  }
}
