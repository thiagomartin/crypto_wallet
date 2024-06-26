namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spiner("Apagando BD....") {%x(rails db:drop)}

      show_spiner("Criando BD....") {%x(rails db:create)}

      show_spiner("Migrando BD....") {%x(rails db:migrate)}

      %x(rails dev:add_mining_types)

      %x(rails dev:add_coins)

     else
      puts "VOCÊ NÃO ESTÁ EM AMBIENTE DE DESENVOLVIMENTO"
    end
  end

  desc "Cadastra as moedas"
    task add_coins: :environment do
    show_spiner("Cadastrando moedas....") do
      coins = [
                {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://toppng.com/uploads/preview/bitcoin-logo-11609355888jfc0e2xxt2.png",
                  mining_type: MiningType.all.find_by(acronym:'PoW')
                },
                {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://w1.pngwing.com/pngs/259/53/png-transparent-money-ethereum-ethereum-classic-fork-bitcoin-blockchain-currency-tether-thumbnail.png",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/dash_dashcoin-512.png",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://www.svgrepo.com/show/420202/internet-internet-of-things-iot.svg",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png",
                  mining_type: MiningType.all.sample
                }
              ]
      coins.each do |coin|
        sleep(1)
      Coin.find_or_create_by!(coin)
    end
  end
end

desc "Cadastra os tipos de mineração"
task add_mining_types: :environment do
  show_spiner("Cadastrando tipos de mineração....") do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]
  mining_types.each do |mining_type|
    sleep(1)
  MiningType.find_or_create_by!(mining_type)
    end
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
