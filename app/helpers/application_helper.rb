module ApplicationHelper
  def pluralize(count, content)
    if count > 1
      "#{count} #{content}s"
    else
      "#{count} #{content}"
    end
  end

  def humanize_location(location)
    hash = {
      city: 'Ville',
      borough: 'Arrondissement'
    }
    return hash[location.class.name.downcase.to_sym]
  end

  def in_group_of(count, number)
    return number if [1, 2, 3].include?(count)

    humanize_price(count, number)
  end

  def humanize_price(count, number)
    if [4, 5, 6].include?(count)
      number = number.to_s.chars
      last_part = number.pop(3).join
      return "#{number.join} #{last_part}"
    elsif [7, 8, 9].include?(count)
      number = number.to_s.chars
      last_part = number.pop(3).join
      middle_part = number.pop(3).join
      return "#{number.join} #{middle_part} #{last_part}"
    end
  end

  def translate_sort_by(sort_by)
    hash = {
      relevance: 'Pertinence',
      price: 'Prix',
      surface: 'Surface',
      rooms: 'Pièces',
      bedrooms: 'Chambres',
      created_at: 'Date'
    }
    return hash[sort_by.to_sym]
  end

  def translate_status(status)
    hash = {
      furnished: 'meublé',
      unfurnished: 'non meublé'
    }
    return hash[status.to_sym]
  end
end
