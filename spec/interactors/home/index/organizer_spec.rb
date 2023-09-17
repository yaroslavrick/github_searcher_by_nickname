# frozen_string_literal: true

RSpec.describe Home::Index::Organizer do
  describe '.call' do
    subject(:result) { described_class.call(name:) }

    it_behaves_like 'organizer',
                    [
                      Home::Index::Search
                    ]
  end
end
