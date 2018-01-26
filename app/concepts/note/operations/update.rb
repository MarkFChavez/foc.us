class Note < ApplicationRecord
  module Operations
    class Update < Trailblazer::Operation
      extend Contract::DSL

      step :find_note!
      step Contract::Build(constant: Note::Contracts::Create)
      step Contract::Validate()
      step :update_note!
      step :assign_item_categories

      def find_note!(options, note_id:, current_user:, **)
        options["model"] = current_user.notes.find_by(id: note_id)
      end

      def update_note!(options, params:, **)
        options["model"].update_attributes!(params)
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
