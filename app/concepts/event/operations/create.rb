class Event < ApplicationRecord
  module Operations
    class Create < Trailblazer::Operation
      extend Contract::DSL

      step Model(Event, :new)
      step :assign_current_user!
      step Contract::Build(constant: Event::Contracts::Create)
      step Contract::Validate()
      step Contract::Persist()

      def assign_current_user!(options, current_user:, **)
        options["model"].user = current_user
      end
    end
  end
end
