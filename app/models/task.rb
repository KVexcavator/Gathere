# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  completed_at :datetime
#  size         :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :integer
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#
class Task < ApplicationRecord
  include Sizeable

  belongs_to :project

  def mark_completed(date = Time.current)
    self.completed_at = date
  end

  def complete?
    completed_at.present?
  end

  def part_of_velocity?
    return false unless complete?
    completed_at > Project.velocity_length_in_days.days.ago
  end

  def points_toward_velocity
    part_of_velocity? ? size : 0
  end
end
