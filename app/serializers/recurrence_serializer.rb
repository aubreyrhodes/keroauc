class RecurrenceSerializer < ActiveModel::Serializer
  attributes :frequency, :start_date, :data

  private

  def data
    object.tasks.first.as_json
  end
end
