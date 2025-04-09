class PatientUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  belongs_to :patient
  
  has_many :appointments
  # validates :first_name, :last_name, :date_of_birth, presence: true       
end
