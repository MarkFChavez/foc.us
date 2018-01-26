class Note < ApplicationRecord
  module Operations
    class Create < Trailblazer::Operation
      extend Contract::DSL

      step Model(Note, :new)
      step :assign_current_user!
      step Contract::Build(constant: Note::Contracts::Create)
      step Contract::Validate()
      step Contract::Persist()
      step :assign_item_categories

      def assign_current_user!(options, current_user:, **)
        options["model"].user = current_user
      end

      def assign_item_categories(options, category_ids:, **)
        categories = Array(category_ids).reject(&:empty?).inject([]) do |collection, id|
          collection << ItemCategory.new(subject: options["model"], category_id: id)
        end

        options["model"].item_categories = categories
      end

    end
  end
end
