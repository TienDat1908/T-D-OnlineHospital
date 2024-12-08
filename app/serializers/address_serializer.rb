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
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city, :state, :zip, :country, :primary_address, :created_at, :updated_at
end
