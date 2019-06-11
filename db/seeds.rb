require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb")
require_relative( "../models/transaction.rb")
require( "pry-byebug" )

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

merchant1 = Merchant.new({ "name" => "Asda" })
merchant1.save()

merchant2 = Merchant.new({"name" => "Homebase"})
merchant2.save()

merchant3 = Merchant.new({"name" => "Odeon"})
merchant3.save()

merchant4 = Merchant.new({"name" => "Easyjet"})
merchant4.save()

tag1 = Tag.new({"name" => "groceries" })
tag1.save

tag2 = Tag.new({"name" => "hardware"})
tag2.save

tag3 = Tag.new({"name" => "entertainment"})
tag3.save

tag4 = Tag.new({"name" => "transport"})
tag4.save

transaction1 = Transaction.new({
  "name" => "Asda",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 100

   })
transaction1.save

transaction2 = Transaction.new({

  "name" => "Homebase",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" => 30

  })
transaction2.save

transaction3 = Transaction.new({
  "name" => "Odeon",
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "amount" => 20
  })
transaction3.save

transaction4 = Transaction.new({
  "name" => "Easyjet",
  "merchant_id" => merchant4.id,
  "tag_id" => tag4.id,
  "amount" => 150
  })
transaction4.save

binding.pry
nil
