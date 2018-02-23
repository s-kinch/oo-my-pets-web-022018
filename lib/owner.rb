require_relative 'cat'
require_relative 'dog'
require_relative 'fish'

class Owner

  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  def initialize(species)
    @species = species
    self.class.all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  attr_reader :species
  attr_accessor :name, :pets

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.values.flatten.each {|pet| pet.mood = "nervous"}
    self.pets = {}
  end

  def list_pets
    fish_num = self.pets[:fishes].length
    cat_num = self.pets[:cats].length
    dog_num = self.pets[:dogs].length
    "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
  end


end
