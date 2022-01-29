def rndStr(n)
  (0...n).map { ('a'..'z').to_a[rand(26)] }.join
end

1000.times do |i|
  User.create(
    first_name: rndStr(10),
    last_name: rndStr(10),
    email: rndStr(10) + "@gmail.com"
  )

  if (i + 1) % 100 == 0
    puts "Created #{i + 1} users"
  end
end
