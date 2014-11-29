require_relative 'racoon'

class Person
  def initialize(person_name)
    # @trophy = []
    @person_name = person_name
  end

  # def command_feed(food)
  #   @raccoon.eat(food)
  # end

  # def command_sleep(number)
  #   @raccoon.sleep(number)
  # end

  # def command_give_trophy(trophy_name)
  #   @raccoon.trophies << Trophy.new(trophy_name)
  #   puts "#{@raccoon.name} acquired #{trophy_name}"
  # end

  # def command_play(activity)
  #   @raccoon.play(activity)
  # end

  # def command_wake
  #   @raccoon.wake_up
  # end

  # def command_get_stats
  #   @raccoon.stats
  # end

end

module Controller
  extend self
# gets.chomp to receive commands -
  @global_time = 0

  def welcome
    puts "Welcome to Virtual Pet App!"
    puts "
                        ,,,
                     .'    `/\_/\\
                   .'       <@I@>
        <((((((((((  )____(  \\./
                   \( \(   \(\\(
                   `-\"`-\"  \" \""
    puts "What is your name?"
    create_person_name(user_input)
    puts "____________________________"
    puts "What is your raccoon's name?"
    create_pet(user_input)
    puts "____________________________"
    command_activities
  end

  def print_activities
    # puts "What would you like your pet to do:"
    puts "eat"
    puts "sleep"
    puts "wake up"
    puts "play"
    puts "wait"
    puts "stats"
    puts "____________________________"

  end

  def command_activities
    sleep(1)
    puts "Is there something you would like #{@raccoon.name} to do?"
    print_activities
    case user_input
    when "eat" then print_edible_options
    when "sleep" then sleep_how_long
    when "wake up" then wake_up_pet
    when "play" then play_options
    when "wait" then @raccoon.wait
    when "stats" then print_stats
    end
  end

  def print_edible_options
    puts "food available:"
    puts "fish"
    puts "kibble"
    puts "crickets"
    puts "water"
    puts "____________________________"
    @raccoon.eat(user_input)
    command_activities
  end

  def create_person_name(person_name)
    @person = Person.new(person_name)
  end

  def create_pet(pet_name)
    @raccoon = Raccoon.new(pet_name)
  end

  def sleep_how_long
    puts "How long do you want #{@raccoon.name} to sleep for?"
    @raccoon.sleep(user_input)
    puts "Come bug me in #{@raccoon.sleeping_amount} hours."
    sleep_method
    puts "____________________________"
  end

  def sleep_method
    sleep_counter = @raccoon.sleep_timer
    while @raccoon.sleep_timer > 0
      @raccoon.sleep_cycle
    end
    sleep(sleep_counter)
    puts "I'M ALIIIIIIVE'
  end

  def wake_up_pet
    puts "WHO DARE DISTURBS ME FROM MY SLUMBER"
    @raccoon.wake_up
    puts "____________________________"
    command_activities
  end

  def play_options
    puts "#{@raccoon.name} can either:"
    puts "1. run"
    puts "2. frisbee"
    @raccoon.play(user_input)
    puts "____________________________"
    command_activities
  end

  def user_input
    gets.chomp
  end

  def passage_of_time
    @global_time += 1
  end

  def reset_time
    @global_time = 0
  end

  def loop_through_activites
    puts ""
  end

  def print_stats
    puts "You require more training: "
    @raccoon.stats
    puts "____________________________"
    command_activities
  end

end

T = Controller

class Trophy
  def initialize(trophy_name)
    @trophy = trophy_name
  end
end


#---DT---

# jack = Person.new
# jack.command_feed("fish")
# jack.command_play("run")
# jack.command_get_stats
# puts ""
# jack.command_sleep
# jack.command_get_stats
# puts ""
# jack.command_wake
# jack.command_get_stats
# jack.command_give_trophy("rookie trophy")
# puts ""

# p T.passage_of_time
# p T.passage_of_time

# p jack.raccoon.sleep_cycle

T.welcome
# T.print_activities
# T.command_activities
# T.sleep_method


