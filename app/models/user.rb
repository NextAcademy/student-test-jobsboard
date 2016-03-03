class User < ActiveRecord::Base
  include Clearance::User

  enum role: {
  	"student" => 0,
  	"employer" => 1,
  	"admin" => 2
  }
end
