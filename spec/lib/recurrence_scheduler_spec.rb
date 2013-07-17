require_relative '../../lib/recurrence_scheduler'

describe RecurrenceScheduler do
  let(:task_repository){ double }
  let(:task) { double }
  let(:task_id) { 1 }
  let(:attributes){ { frequency: 'daily', task_id: task_id } }
  let(:recurrence_class){ double }
  let(:saved_recurrence){ double(id: 2) }

  before do
    task_repository.stub(:find).with(task_id).and_return(task)
    task.stub(:update_attributes)
    recurrence_class.stub(:create).with( frequency: 'daily').and_return(saved_recurrence)
  end

  describe '#schedule' do
    subject { RecurrenceScheduler.new(task_repository, recurrence_class).schedule(attributes) }

    it 'sets the new recurrences attributes' do
      recurrence_class.should_receive(:create).with( frequency: 'daily').and_return(saved_recurrence)
      subject
    end

    it 'sets the appropriate tasks recurrence id' do
      task.should_receive(:update_attributes).with(recurrence_id: 2)
      subject
    end

    it 'returns the new recurrence record' do
      expect(subject).to eq(saved_recurrence)
    end
  end
end
