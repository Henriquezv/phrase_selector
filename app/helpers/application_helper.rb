module ApplicationHelper
    def locale(locale)
        if I18n.locale == :en
            "Ingles"
        else
            "Pt-BR"
        end
    end
end
