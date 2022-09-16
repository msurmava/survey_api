class Option < ApplicationRecord
  belongs_to :question
  validates :body, uniqueness: { scope: :question_id }
  validate :only_one_correct_option_for_question
  validate :each_question_fas_limited_options
  validate :at_least_one_true


  protected
  def at_least_one_true
    options = Option.where(:question_id => question_id)
    if options.count == 3 && !options.include?(true) && correct == false 
      errors.add(:correct_answer, 'please add at least one correct option')
    end
  end

  def each_question_fas_limited_options
    options = Option.where(:question_id => question_id).count
    errors.add(:limit, 'options already present for tis question') if options == 4
  end

  def only_one_correct_option_for_question
    return unless correct?
    corrects = Option.where(:correct => true, :question_id => question_id)
    # if persisted?
    #   corrects = corects.where('id != ?', id)
    # end
    if corrects.exists?
      errors.add(:correct, 'cannot have another correct answer')
    end           
  end
end

