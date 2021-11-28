class User < ActiveRecord::Base
    
    has_many :movie_entries
    has_secure_password

end
