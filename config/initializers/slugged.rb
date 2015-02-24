module FriendlyId::Slugged
  def resolve_friendly_id_conflict(candidates)
    column = friendly_id_config.slug_column
    separator = friendly_id_config.sequence_separator
    slug = normalize_friendly_id(candidates.first)
    count = self.class.where("#{column} like '#{slug}%'").count
    if self.class.where("#{column} like '#{slug}%'").count >= 1
      "#{slug}#{separator}#{count}"
    end
  end
end

