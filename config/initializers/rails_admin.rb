RailsAdmin.config do |config|

  # Use Devise to authenticate
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # Only allow admins to access /admin routes
  # NOTE: We are probably going to want to use cancancan for this at some point
  # to give us more granular control over resource authorization
  # https://github.com/sferik/rails_admin/wiki/Authorization
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.is_admin?
  end

  # # Use CanCanCan to authorize
  # config.authorize_with do
  #   config.authorize_with :cancan
  # end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
