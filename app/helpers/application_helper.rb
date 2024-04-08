module ApplicationHelper
  def locale
    if I18n.locale == :en
      "US"
    else
      "PT-BR"
    end

  end

  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def nome_aplicação
    "Crypto_Wallet App"
  end

  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"
      elsif Rails.env.production?
        "Produção"
      else
        "Teste"
    end
  end
end
