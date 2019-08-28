class User < ActiveRecord::Base

	has_secure_password

	validates :name, presence: true
	validates_uniqueness_of :username
	validates :password, length: {in: 4..20}, confirmation: true,
    unless: Proc.new { |a| a.password.blank? }
    validates :password_confirmation, presence:true, unless: Proc.new { |a| a.password.blank? }

	has_many :readings
end