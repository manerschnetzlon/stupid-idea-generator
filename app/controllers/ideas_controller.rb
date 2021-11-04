require 'json'

class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.order(created_at: :desc)
  end

  def show
    @idea = Idea.find(params[:id])
    # @last_ideas = Idea.all.order(created_at: :desc).limit(5)
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
    serialized_dictionary = File.read('db/dictionnaire.json')
    dictionary = JSON.parse(serialized_dictionary)
    subject = dictionary['dictionnaire']['sujets'].sample
    verb = dictionary['dictionnaire']['verbes']['transitifs'].sample
    complement = dictionary['dictionnaire']['complements']['objDir'].sample
    sentence = "#{subject.capitalize} pour #{verb} #{complement}."

    sentence.gsub(/#\d+/, '').gsub(/{/, ' ').gsub(/}/, '')
  end
end

# A FAIRE :
## gerer multiline typewriting OK
## validation uniqueness OK
## index de toutes les dernieres idees
## adopter une idee
### formulaire pour mettre nom
### impossible de regenerer cette phrase
