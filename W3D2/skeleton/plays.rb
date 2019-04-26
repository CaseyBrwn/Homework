require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton



  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
      SQL

      return nil unless play.length > 0
    Play.new(play.first)
  end

  def find_by_playwright(name)
    play_write = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        title
      FROM
        plays
        JOIN playwrigts ON title.playwrights_id = playwrights.id
      WHERE
        name = ?
    SQL
    plays.map { |play| Play.new(play) }


  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def 
end

# class Playwrights

#    def self.all
#     data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
#     data.map { |datum| Playwrights.new(datum) }
#   end

#   def find_by_name(name)
#     wright = PlayDBConnection.instance.execute(<<-SQL, name)
#       SELECT
#         *
#       FROM
#         playwrights
#       WHERE
#         name = ?
#      SQL
#      return nil if wright.lengtht > 0
#      Playwrights.new(wright)
#   end

#   def initialize(options)
#     @id = options['id']
#     @name = options['name']
#     @birthyear = options['birthyear']
#   end

#   def playwright_create
#     raise "#{self} already in database" if self.id
#     PlayDBConnection.instance.execute(<<-SQL, self.name, self.birthyear)
#     INSERT INTO
#         playwrights (name, birthyear)
#       VALUES
#         (?, ?)
#     SQL
#     self.id = PlayDBConnection.instance.last_insert_row_id
#   end

#   def playwright_update
#     raise "#{self} not in database" unless self.id
#     PlayDBConnection.instance.execute(<<-SQL, self.name, self.birthyear, self.id)
#       UPDATE
#         playwrights
#       SET
#         name = ?, birthyear = ?
#       WHERE
#         id = ?
#     SQL
#   end

#   def playwright_get_plays(name)
#     plays = PlayDBConnection.instance.execute(<<-SQL, name)
#       SELECT
#         title
#       FROM
#         playwright
#         JOIN plays ON playwright.id = title.playwrights_id
#       WHERE
#         name = ?
#     SQL
#     return nil unless plays.length > 0
#     plays.map { |play| Play.new(play) }
#   end

# end
