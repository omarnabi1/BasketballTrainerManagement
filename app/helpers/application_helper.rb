module ApplicationHelper
    def error_messages_for(model, attribute)
        render "shared/error_messages", model: model, attribute: attribute
    end
end
