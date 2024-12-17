# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  date_of_birth          :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  nick_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  status                 :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin_user_id          :bigint           not null
#
# Indexes
#
#  index_users_on_admin_user_id         (admin_user_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar

  belongs_to :admin_user

  has_many :post_articles
  has_many :addresses, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  has_one :primary_address, -> { where(primary_address: true) }, foreign_key: :user_id, class_name: 'Address'

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :set_default_admin_user, on: :create

  delegate :city, :state, :zip, :street, :country, to: :primary_address, allow_nil: true

  enum gender: { male: 'male', female: 'female' }

  with_options on: :update_profile do
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    validates :gender, inclusion: { in: %w[male female] }
    validates :phone_number, presence: true
    validates :nick_name, presence: true
  end

  validates :first_name, :last_name, :phone_number, :nick_name, :date_of_birth, :gender, presence: true, on: :update_profile

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id email phone_number first_name last_name]
  end

  private

  def set_default_admin_user
    self.admin_user ||= AdminUser.first
  end
end
