node default {
}

node 'target' inherits default {
  include passenger
  include sqlite
  include git
  include mysql
}
