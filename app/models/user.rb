class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :requests, dependent: :destroy

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  after_create :assign_default_role

  def assign_default_role
    add_role(:requester)
  end

  def self.from_omniauth(request)
    auth = request.env['omniauth.auth']
    role = request.env['omniauth.params']['role']

    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image

      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end

    user.add_role role.to_sym if role == 'entertainer'

    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def is_admin?
    has_role? :admin
  end

  def is_entertainer?
    has_role? :entertainer
  end

  def is_requester?
    has_role? :requester
  end
end
