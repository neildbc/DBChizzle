class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    order('total_karma DESC')
  end

  def self.page(number)
    offset = (number - 1) * 50

    t = Time.now
    retVal = self.by_karma.offset(offset).limit(50)
    puts Time.now - t
    retVal
  end

  def update_karma(value)
    self.total_karma += value
    self.save
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
