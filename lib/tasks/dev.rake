namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spiner("Apagando BD....") {%x(rails db:drop)}

      show_spiner("Criando BD....") {%x(rails db:create)}

      show_spiner("Migrando BD....") {%x(rails db:migrate)}

      show_spiner("Populando BD...." ) {%x(rails db:seed)}
     else
      puts "VOCÊ NÃO ESTÁ EM AMBIENTE DE DESENVOLVIMENTO"
    end
  end


private

  def show_spiner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}....")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")

  end
end
