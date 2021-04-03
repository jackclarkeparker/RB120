=begin

Alyssa has been assigned a task of modifying a class that was
initially created to keep track of secret information.
The new requirement calls for adding logging, when clients of
the class attempt to access the secret data.
Here is the class in its current form:

=end

class SecretFile
  def data
    watch_dog.create_log_entry
    @data
  end

  def initialize(secret_data, security_logger)
    @data = secret_data
    @watch_dog = security_logger
  end

  private
  attr_reader :watch_dog
end

=begin

She needs to modify it so that any access to data must result
in a log entry being generated. That is, any call to the class
which will result in data being returned must first call a
logging class. The logging class has been supplied to Alyssa
and looks like the following:

=end

class SecurityLogger
  def initialize
    @times_file_accessed = 0
  end

  def create_log_entry
    @times_file_accessed += 1
  end
end

bot = SecurityLogger.new
pron = SecretFile.new('xxx', bot)
pron.data
pron.data
pron.data
puts bot.instance_variable_get("@times_file_accessed")

=begin

Hint: Assume that you can modify the initialize method in
SecretFile to have an instance of SecurityLogger be passed in
as an additional argument. It may be helpful to review the
lecture on collaborator objects for this practice problem.

=end
