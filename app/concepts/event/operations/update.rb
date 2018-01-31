class Event < ApplicationRecord
  module Operations
    class Update < Trailblazer::Operation
      extend Contract::DSL

      step :find_model!
      step Contract::Build(constant: Event::Contracts::Create)
      step Contract::Validate()
      step Contract::Persist()

      def find_model!(options, id:, current_user:, **)
        options["model"] = current_user.events.find(id)
      end
    end
  end
end
