class Raccoon
  attr_accessor :trophies, :name, :sleeping_amount
  attr_reader :sleep_timer
  def initialize(name)
    @name = name
    @trophies = []
    @hunger = 0
    @play_status = 0
    @asleep = false
    @sleep_timer = 0
    @skill_level = 0
    @age = 0
  end

  def stats
    puts "Name: #{@name}."
    puts "Hunger Level: #{@hunger}."
    puts "Sleep Status: #{@asleep}."
    puts "Skill Level: #{@skill_level}."
    puts "Age: #{@age}."
  end

  def eat(input)
    if input == "fish"
      @hunger += 2
      p "Thanks for the fish dawg"
    elsif input == "kibble" or input == "crickets"
      @hunger += 1
      p "WHAT DO YOU THINK I AM? THAT'S NASTY"
    elsif input == "water"
      puts "#{@name} feels more hydrated."
    else
      puts "#{@name} looks at you expectedly."
    end
    # sleep_cycle
    sleep_cycle
  end

  def sleep(hours)
    @asleep = true
    @sleeping_amount = hours
  end

  def sleep_cycle
    T.passage_of_time
    @sleep_timer -= 1 # unless @sleep_timer <= 0
    sleep(1)
  end

  def wake_up
    if @sleep_timer == 0
      @asleep = false
      # puts "#{name} woke up."
    end
  end

  def play(activity)
    if @asleep == false
      if activity == "frisbee"
        @hunger -= 1
        level_up
        @play_status += 1
        return puts "#{@name} caught the frisbee!. He acts hungrier."
      elsif activity == "run"
        @hunger -= 1
        level_up
        @play_status += 1
        return puts "#{@name} ran around and learned a little bit. He acts hungrier."
      else
        puts "#{@name} doesn't recognize your command."
      end
    end
    T.passage_of_time
    level_up
  end

  def level_up
    @skill_level += 1
  end

  def wait
    puts "okay, i'll go chill in my boss pokemon room"
    T.passage_of_time
  end

end

