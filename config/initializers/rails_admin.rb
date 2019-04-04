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

  config.model 'Intervention' do
    navigation_icon 'icon-wrench'
    edit do
      field :user do
        help 'Required'
      end
      field :building do
        help 'Required'
      end
      field :battery do
        help 'Optional'
      end
      field :column do
        help 'Optional'
      end
      field :elevator do
        help 'Optional'
      end
      field :intervention_start do
        help 'Required'
      end
      field :intervention_finish do
        help 'Optional'
      end
      field :intervention_result do
        help 'Required'
      end
      field :report do
        help 'Optional'
      end
      field :intervention_status do
        help 'Required'
      end
    end
  end

  config.model 'Geolocation' do
    visible false
  end
  config.model 'Stat' do
    visible false
  end

  config.model 'Gmap' do
   visible false
  end

  config.model 'User' do
    navigation_icon 'icon-user'
    weight -3
  end

  config.model 'Customer' do
    navigation_icon 'icon-star'
    weight -2
  end

  config.model 'Lead' do
    navigation_icon 'icon-inbox'
    weight 1
  end

  config.model 'Quote' do
    navigation_icon 'icon-folder-open'
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
    navigation_icon 'icon-home'
    weight -1
  end

  config.model 'Address' do
    navigation_icon 'icon-list-alt'
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
