ActiveAdmin.register Flat do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    column :id
    column :user_id
    column :name
    column :address
    actions
  end

  form do |f|
    f.inputs "Flat Details" do
      f.input :name
      f.input :address
      f.input :accomodates
      f.input :description
      f.input :price
      f.input :has_AC
      f.input :has_jacuzzi
    end
    f.actions
  end

  permit_params :user_id, :name, :address, :description, :accomodates

end