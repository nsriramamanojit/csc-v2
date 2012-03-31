authorization do

  role :admin do
    has_permission_on [:users], :to=>[:index,:show,:new,:create,:edit,:update,:load_divisions,:load_districts,:load_blocks,:load_panchayats,:approve,:profile,:profile_edit,:profile_update,:change_password,:password_change]
  end

  role :super do
    has_permission_on [:users], :to=>[:index,:show,:new,:create,:edit,:update,:load_divisions,:load_districts,:load_blocks,:load_panchayats,:approve,:profile,:profile_edit,:profile_update,:change_password,:password_change]
    has_permission_on [:states,:divisions,:districts,:blocks,:panchayats], :to=>[:index,:show,:new,:create,:edit,:update,:export,:approve]
  end

end