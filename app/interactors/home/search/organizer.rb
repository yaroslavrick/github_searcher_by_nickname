# frozen_string_literal: true

module Home
  module Search
    class Organizer < BaseOrganizer
      organize Home::Search::Initialization,
               # Home::Search::Validation,
               Home::Search::Search
    end
  end
end
