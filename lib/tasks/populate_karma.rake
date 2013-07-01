
task :populate_karma => :environment  do
  User.all.each do |user|
    user.update_attribute(:total_karma, KarmaPoint.where('user_id=?',user.id).inject(0) { |res,i| res + i.value })
  end
end

