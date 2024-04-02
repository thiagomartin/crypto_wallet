# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas....")
    spinner.auto_spin
coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://toppng.com/uploads/preview/bitcoin-logo-11609355888jfc0e2xxt2.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://w1.pngwing.com/pngs/259/53/png-transparent-money-ethereum-ethereum-classic-fork-bitcoin-blockchain-currency-tether-thumbnail.png"
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/dash_dashcoin-512.png"
  }
  ]
coins.each do |coin|
  sleep(1)
Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído!)")
