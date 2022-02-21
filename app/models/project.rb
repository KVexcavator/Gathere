# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  due_date   :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  class << self
    def velocity_length_in_days
      21
    end
  end

  validates :name, presence: true

  def incomplete_tasks
    tasks.reject(&:complete?)
  end

  def done?
    incomplete_tasks.empty?
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end

  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / Project.velocity_length_in_days
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan?
    (Time.zone.today + projected_days_remaining) <= due_date
  end
end
