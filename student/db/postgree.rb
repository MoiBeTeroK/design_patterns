require 'pg'
class PG_client
  def initialize
    self.client = PG.connect(
      dbname: 'Student',
      user: 'postgres',
      password: 'l1u2d3a4G',
      host: 'localhost',
      port: 5432
    )
  end

  def exec(query)
    client.exec(query)
  end

  def exec_params(query)
    client.exec_params(query)
  end
  
  private
  attr_accessor :client
end