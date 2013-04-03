class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :cart
  has_many :orders

  validates_confirmation_of :password, message: "should match confirmation", if: :password
  validates :password, :length => { :in => 8..16 }

  validates :username, :uniqueness => { case_sensitive: false },
                       :length => { :in => 2..32 },
                       :allow_blank => true

  validates :first_name, :presence => true,
                         :format => { :with => /\A[a-zA-Z]+\z/,
                                      :message => "Only letters allowed" }
  validates :last_name, :presence => true,
                        :format => { :with => /\A[a-zA-Z]+\z/,
                                     :message => "Only letters allowed" }
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
                                 :message => "Please enter a valid email address"}

end
