Rails.application.routes.draw do
  get "cooperative_branches/edit"
  resources :loan_applications
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :memberships
  resources :members do
    collection do
      get :search
    end

    resources :loan_applications do
      resources :guarantor_undertakings
      resources :term_loan_agreements
      resources :pro_notes
      resources :demand_promissory_notes
      resources :hypothecation_deeds
    end

    resources :income_declarations
    resources :jewel_loans do
      resources :jewel_appraisers_reports
      resources :jewel_loan_promissory_notes
    end

    resources :additional_shares_applications
  end

  resources :term_loan_agreements
  resources :pro_notes
  resources :demand_promissory_notes
  resources :hypothecation_deeds
  resources :income_declarations
  resources :guarantor_undertakings
   
  resources :cooperative_branches
  resources :jewel_loans
  resources :additional_shares_applications
  resources :shg_loan_applications do
    resources :shg_personal_agreements
    resources :shg_loan_pro_notes
    resources :shg_term_loan_agreements
    resources :shg_demand_promissory_notes
  end

  # ✅ Set the root path
  root "members#index"
  resources :self_help_groups do
    resources :shg_loan_applications do
      resources :shg_loan_pro_notes
      resources :shg_term_loan_agreements
      resources :shg_personal_agreements do
        collection do
          get :autocomplete
        end
      end
    end
  end

  # Admin routes for super_admin
  get 'admin', to: 'admin#dashboard'
  get 'admin/dashboard', to: 'admin#dashboard'
  
  # Branch management routes
  get 'admin/branches', to: 'admin#branches'
  get 'admin/branches/new', to: 'admin#new_branch', as: 'admin_new_branch'
  post 'admin/branches', to: 'admin#create_branch', as: 'admin_create_branch'
  get 'admin/branches/:id', to: 'admin#show_branch', as: 'admin_show_branch'
  get 'admin/branches/:id/edit', to: 'admin#edit_branch', as: 'admin_edit_branch'
  patch 'admin/branches/:id', to: 'admin#update_branch', as: 'admin_update_branch'
  delete 'admin/branches/:id', to: 'admin#destroy_branch', as: 'admin_destroy_branch'
  
  # User management routes
  get 'admin/users', to: 'admin#users'
  get 'admin/users/new', to: 'admin#new_user', as: 'admin_new_user'
  post 'admin/users', to: 'admin#create_user', as: 'admin_create_user'
  get 'admin/users/:id/edit', to: 'admin#edit_user', as: 'admin_edit_user'
  patch 'admin/users/:id', to: 'admin#update_user', as: 'admin_update_user'
  delete 'admin/users/:id', to: 'admin#destroy_user', as: 'admin_destroy_user'

  get '/members/:id/co_applicant_form', to: 'members#co_applicant_form'
end
