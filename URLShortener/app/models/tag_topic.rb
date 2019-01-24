# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint(8)        not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many :tags,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tagging

  has_many :urls,
    through: :tags,
    source: :url
end
