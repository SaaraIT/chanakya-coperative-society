class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :cooperative_branch, optional: true

  validates :cooperative_branch, presence: true, unless: :super_admin?

  enum :role, {
                super_admin: "super_admin",
                admin: "admin",
                manager: "manager",
                staff: "staff"
              }, prefix: true # optional: gives you methods like user.role_admin?


  def super_admin?
    role == "super_admin"
  end

  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end
end
