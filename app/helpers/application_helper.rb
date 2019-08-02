module ApplicationHelper

    def observation?
        if params[:observation_id]
            "<%= link_to observation.name , observation %>"
        end
    end

    def can_edit?(model)
        bool = false
        model.observations.each do |ob|
            if ob.user_id == session[:user_id]
                bool = true
            end
        end
        bool
    end

end
