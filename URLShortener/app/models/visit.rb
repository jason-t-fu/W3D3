# == Schema Information
#
# Table name: visits
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#  short_url_id :integer          not null
#

class Visit < ApplicationRecord
  validates :user_id, :short_url_id, presence: true

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :short_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, short_url)
    Visit.new(user_id: user.id, short_url_id: short_url.id).save
  end

end
