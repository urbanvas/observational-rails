module ApplicationHelper

    def observation?
        if params[:observation_id]
            "<%= link_to observation.name , observation %>"
        end
    end
end
