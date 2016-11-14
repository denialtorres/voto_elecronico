class RfcValidator < ActiveModel::EachValidator
  # rubocop:disable Metrics/LineLength
  def validate_each(record, attribute, value)
    unless value =~ /([A-Z,&]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[A-Z|\d]{3})/i
      locale = "activerecord.errors.models.#{record.class.to_s.downcase}.attributes.#{attribute}.rfc"
      msg = I18n.exists?(locale) ? I18n.t(locale) : false
      record.errors[attribute] << (options[:message] || msg || 'is not a valid RFC')
    end
  end
end
