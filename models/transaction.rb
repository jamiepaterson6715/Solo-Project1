require_relative( '../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :name, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
end

def save()
  sql = "INSERT INTO transactions
      ( name,
        amount,
        merchant_id,
        tag_id
      )
      VALUES
      ( $1, $2, $3, $4 )
      RETURNING id"
      values = [@name, @amount, @merchant_id, @tag_id]
      transaction_data = SqlRunner.run(sql, values)
      @id = transaction_data.first()['id'].to_i

    end

  def update()
    sql = "UPDATE transactions
    SET
    (
      name,
      amount,
      merchant_id,
      tag_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @amount, @merchant_id, @tag_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
end

  def self.all()
      sql = "SELECT * FROM transactions"
      transactions_data = SqlRunner.run(sql)
      transactions = map_items(transactions_data)
      return transactions
    end

    def self.find(id)
      sql = "SELECT * FROM transactions
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
    transaction = Transaction.new(result)
      return transaction
    end


end
