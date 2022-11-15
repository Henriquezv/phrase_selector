namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Executando Tarefas ...")
      spinner.auto_spin # Automatic animation with default interval

      %x(rails db:drop) 
      %x(rails db:create) 
      %x(rails db:migrate) 
      %x(rails dev:add_mood_types) 
      %x(rails dev:add_phrases) 
      spinner.success("(Concluído!)") # Stop animation
    end
  end

  desc "Cadastro de Frases"
  task add_phrases: :environment do

    file = File.read(Rails.root.join('lib','seeds','mensagens.sql'))

    file = file.split('),')
    
    file.each do |line|
        line = line.split(',')
        text = line[4].gsub("'",'')
        #text = line[4].gsub('\r\n','')
        obj = {text: text , mood_type_id: 5}
        Phrase.create!(obj)
    end
  end
    

  desc "Cadastro de Estados de Ânimo"
  task add_mood_types: :environment do

    mood_types = [   
      {
      description: "SATISFAÇÃO"
      },
      {
      description: "INSATISFAÇÃO"
      },
      {
      description: "DESANIMAÇÃO"
      },
      {
      description: "ANIMAÇÃO"
      },
      {
      description: "INDEFINIDO"
      }
  ]

    mood_types.each do |mood_type|
    MoodType.find_or_create_by!(mood_type)
    end
  end

end
