# frozen_string_literal: true

module LocaleFlag
  LOCALE_TO_FLAG = {
    en: 'us',
    uk: 'ua'
  }.freeze

  def flag_code(locale)
    LOCALE_TO_FLAG[locale.to_sym]
  end
end
