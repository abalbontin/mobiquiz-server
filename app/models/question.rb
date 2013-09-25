class Question < ActiveRecord::Base
  validates_presence_of :question, :answer1, :answer2, :answer3, :answer4, :solution, :difficulty
  validates_numericality_of :solution, :difficulty
  validates_inclusion_of :solution, :in => 1..4, :message => "debe contener una de las opciones disponibles: 1, 2, 3 ó 4"
  validates_inclusion_of :difficulty, :in => 1..3, :message => "debe contener una de las opciones disponibles: 1, 2 ó 3"
end
