# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :users

  has_many :distinct_visitors,
    -> { distinct },
    through: :visits,
    source: :users

  def self.random_code
    begin
      url = SecureRandom::urlsafe_base64
      raise if ShortenedUrl.exists?(short_url: url)
    rescue
      retry
    end
    url
  end

  def self.create!(user, long_url)
    short_url = ShortenedUrl.random_code
    entry = ShortenedUrl.new(short_url: short_url, 
                              long_url: long_url,
                              user_id: user.id)
    
    entry.save
    entry
  end

  def num_clicks
    visitors.count
  end

  def num_uniques
    distinct_visitors.select(:user_id).count
  end

  def num_recent_uniques
    distinct_visitors.select(:user_id).where(updated_at >= 10.minutes.ago).count
  end
end
