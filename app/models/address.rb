# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  city            :string
#  country         :string
#  primary_address :boolean          default(FALSE)
#  state           :string
#  street          :string
#  zip             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Address < ApplicationRecord
  belongs_to :user

  validates :city, :country, :state, :street, :zip, presence: true

  scope :exclude_current, ->(address_id) { where.not(id: address_id) }

  before_create :set_primary_address

  private

  def set_primary_address
    if user.addresses.count == 0
      self.primary_address = true
    end
  end
end
