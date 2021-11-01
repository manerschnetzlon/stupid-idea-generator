require "json"

class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
    @ideas = Idea.all.order(created_at: :desc).limit(10)
  end

  def create
    name = generate_name_idea
    @idea = Idea.new(name: name)
    if @idea.save
      redirect_to idea_path(@idea)
    else
      redirect_to ideas_path, notice: 'something went wrong'
    end
  end

  private

  def generate_name_idea
    filepath = 'db/dictionnaire.json'
    serialized_dictionary = File.read(filepath)
    dictionary = JSON.parse(serialized_dictionary)
    # TODO => keys to_sym
    subject = dictionary['dictionnaire']['sujets'].sample
    ## SIMPLE SENTENCE
    # verb = dictionary['dictionnaire']['verbes']['intransitifs'].sample
    # sentence = "#{subject.capitalize} pour #{verb}."
    ## SIMPLE SENTENCE +
    verb = dictionary["dictionnaire"]["verbes"]["transitifs"].sample
    complement = dictionary["dictionnaire"]["complements"]["objDir"].sample
    sentence = "#{subject.capitalize} pour #{verb} #{complement}."

    sentence.gsub!(/#\d+/, '')
    sentence.gsub!(/{/, ' ')
    sentence.gsub!(/}/, '')
    sentence

  end
end
