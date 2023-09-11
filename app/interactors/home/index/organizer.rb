# frozen_string_literal: true

module Home
  module Index
    class Organizer < BaseOrganizer
      organize Home::Index::Search
    end
  end
end
