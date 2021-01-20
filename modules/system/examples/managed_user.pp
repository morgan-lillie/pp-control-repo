$password = '$1$ncmQV8jV$15KOG5prPO1DP5jFWOOau1'

system::managed_user { ['aaron', 'kaitlin', 'jose']:
  password => $password,
}
