# frozen_string_literal: true

class Task < ApplicationRecord
  include AutoCompletable
  belongs_to :task_list
  validates :description, :complete inclusion: { in: [true, false] }, presence: true
  #I found another bug here. I'm wondering if I should figure out how
  #to adjust this validation or just run a migration to change 'complete's
  #default to 'true'.

end
