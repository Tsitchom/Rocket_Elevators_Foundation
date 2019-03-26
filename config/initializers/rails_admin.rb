RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
   warden.authenticate! scope: :user
 end
 config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'Geolocation' do
    visible false
  end
  config.model 'Stat' do
    visible false
  end

  config.model 'User' do
    navigation_icon 'icon-user'
    weight -3
  end

  config.model 'Customers' do
    weight -2
  end

  config.model 'Lead' do
    weight 1
  end

  config.model 'Quote' do
    weight 2
  end

  config.model 'BuildingDetail' do
    parent Building
  end
  
  config.model 'Battery' do
    parent Building
  end

  config.model 'Column' do
    parent Building
  end
  
  config.model 'Elevator' do
    parent Building 
  end

  config.model 'Building' do
    weight -1
  end

  config.model 'Address' do
    weight 0
  end


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

    config.current_user_method(&:current_user)

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
