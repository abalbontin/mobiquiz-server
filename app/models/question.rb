class Question < ActiveRecord::Base
  validates_presence_of :question, :answer1, :answer2, :answer3, :answer4
  validates_inclusion_of :solution, :in => 1..4, :message => "debe indicar la respuesta correcta"
  validates_inclusion_of :difficulty, :in => 1..3, :message => "debe indicar un nivel de dificultad: Fácil, Media o Difícil"
end
