module Rake
  class Task
    attr_accessor :plugin
    alias :old_comment :comment
    def comment
      "%-#{$plugin_max}s # %s" % [plugin, old_comment] if old_comment
    end
  end

  module TaskManager
    ##
    # This gives us access to the tasks already defined in rake.
    def all_tasks
      @tasks
    end
  end

  ##
  # Simple shortcut for Rake.application.all_tasks
  def self.all_tasks
    Rake.application.all_tasks
  end

  ##
  # Hooks into rake and allows us to clear out a task by name or
  # regexp. Use this if you want to completely override a task instead
  # of extend it.
  def self.clear_tasks(*tasks)
    tasks.flatten.each do |name|
      case name
      when Regexp then
        all_tasks.delete_if { |k,_| k =~ name }
      else
        all_tasks.delete(name)
      end
    end
  end

  ##
  # Removes the last action added to a task. Use this when two
  # libraries define the same task and you only want one of the
  # actions.
  #
  #   require 'hoe'
  #   require 'tasks/rails'
  #   Rake.undo("test") # rolls out rails' test task
  def self.undo(*names)
    names.each do |name|
      all_tasks[name].actions.delete_at(-1)
    end
  end
end
