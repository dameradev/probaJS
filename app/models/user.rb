class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :name

  def first_name
    self.name.split.first 
  end

  def last_name
    self.name.split.last
  end
end



# When to use begin-rescue blocks, DEBUGGING last lesson
# def get_facebook_messages
#   begin
#     contacts_fb
#     @messages = retrieves_messages
#   rescue IOError => e
#     flash[:error] = "Error occured contacting facebook #{e}"
#   end
# end
