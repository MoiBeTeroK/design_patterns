require 'pg'
class PGClient
  
  def exec(query)
    client.exec(query)
  end

  def exec_params(query)
    client.exec_params(query)
  end

  def close
    client.close
  end
  
  def self.instance
      @instance ||= new
  end

  private
  attr_accessor :client

  @instance = nil

  def initialize
    self.client = PG.connect(
      dbname: 'Student',
      user: 'postgres',
      password: 'l1u2d3a4G',
      host: 'localhost',
      port: 5432
    )
  end
end