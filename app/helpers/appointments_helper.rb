module AppointmentsHelper

    def index_display_header
        if @user
            content_tag(:h1, "#{@user.username}'s Sessions:")
        else
            content_tag(:h2, "Hoop Sessions")
        end
    end

    def display_appointments
        if @user.appointments.empty?
            tag.h2(link_to('No Appointments', new_appointment_path))
        end
    end

end
