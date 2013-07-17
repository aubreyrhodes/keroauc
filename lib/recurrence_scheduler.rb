class RecurrenceScheduler

  attr_reader :task_repository, :recurrence_class

  def initialize( task_repository = Task, recurrence_class = Recurrence)
    @task_repository = task_repository
    @recurrence_class = recurrence_class
  end

  def schedule(attributes)
    task_id = attributes.delete(:task_id)
    saved_recurrence = recurrence_class.create(attributes)
    affected_task(task_id).update_attributes(recurrence_id: saved_recurrence.id)
    saved_recurrence
  end

  def self.schedule(attributes)
    new.schedule(attributes)
  end

  private

  def affected_task(id)
    task_repository.find(id)
  end
end
