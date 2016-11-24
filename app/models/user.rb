class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
    after_create :send_admin_mail
    
      def send_admin_mail
        AdminMailer.new_user_waiting_for_approval(self).deliver
      end
         
    has_many :recipes
    has_many :ingredients
    has_many :overheads
   
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

   
   
    def active_for_authentication? 
        super && approved? 
    end 

    def inactive_message 
        if !approved? 
          :not_approved 
        else 
          super # Use whatever other message 
        end 
    end
end
