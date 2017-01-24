module ApplicationHelper

  def dashboard_path
    if current_user.present?
      orders_path
    else
      root_path
    end
  end

   def yes_no(value)
    (value.to_i != 0) ? "Yes" : "No"
  end

end
