module UsersHelper
  def test
    users = User.where('first_name LIKE ?', '%xx%')

    users.each do |user|
      puts user.first_name
    end
  end
end
