# == Schema Information
#
# Table name: taggings
#
#  id         :bigint(8)        not null, primary key
#  topic_id   :integer          not null
#  url_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ApplicationRecord
end
