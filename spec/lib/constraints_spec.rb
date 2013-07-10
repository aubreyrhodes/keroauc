require_relative '../../lib/constraints/auth_constraint'
require 'active_support/core_ext'

describe AuthConstraint do
  describe '#matches?' do
    it 'returns false if user_id is not present in the session' do
      request = double( session: {} )
      expect(subject.matches?(request)).to be_false
    end

    it 'returns true if user_id is present in the session' do
      request = double( session: { 'user_id' => 123 } )
      expect(subject.matches?(request)).to be_true
    end
  end
end
