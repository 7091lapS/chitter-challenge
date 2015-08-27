class Peep
  include DataMapper::Resource

  property :id, Serial
  property :updated_at, DateTime 
  property :content, String
  belongs_to :user
end
