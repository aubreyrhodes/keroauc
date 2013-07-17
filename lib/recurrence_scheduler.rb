class RecurrenceScheduler

  attr_reader :task_repository

  def initialize( task_repository = Task)
    @task_repository = task_repository
  end

  def schedule(attributes, user)
    task_id = attributes.delete(:task_id)
    saved_recurrence = user.recurrences.create!(attributes)
    affected_task(task_id).update_attributes(recurrence_id: saved_recurrence.id)
    saved_recurrence
  end

  def self.schedule(attributes, user)
    new.schedule(attributes, user)
  end

  private

  def affected_task(id)
    task_repository.find(id)
  end
end
