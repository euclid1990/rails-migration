require 'bcrypt'

class User < ActiveRecord::Base
end

users = [
  ['Nguyen Van A', '1990-01-01', 'abcdef'],
  ['Nguyen Thi B', '1991-12-20', 'ghijkl'],
  ['Nguyen Van C', '1992-07-23', 'mnlopq'],
]

users.each do |name, birthday, password, signed_in_at, signed_out_at|
  User.create(
    name: name,
    birthday: birthday,
    password: BCrypt::Password.create(password),
    signed_in_at: DateTime.now,
    signed_out_at: DateTime.now
  )
end