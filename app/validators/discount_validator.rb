class DiscountValidator < ActiveModel::Validator
  def validate(record)
    validate_date_exists(record)
    validate_dates_order(record)
  end

  def validate_date_exists(record)
    null_dates_error = validate_null_date(record)
    same_date_error = validate_same_date(record)
    return unless null_dates_error || same_date_error
    record.errors.add(:base, 'Já existe um desconto nesse período.')
  end

  def validate_null_date(record)
    Discount.all.without_end.any? && record.end_date.nil?
  end

  def validate_same_date(record)
    discounts = Discount.all.where(
        '(:start_date >= start_date and end_date is null)'\
      'or (:start_date >= start_date and :start_date <= end_date)'\
      'or (:end_date >= start_date and :end_date <= end_date)',
        start_date: record.start_date, end_date: record.end_date
    )
    (discounts - [record]).any?
  end

  def validate_dates_order(record)
    return if record.start_date < record.end_date
    record.errors.add(:base, 'Data de fim menor que data de início.')
  end
end
