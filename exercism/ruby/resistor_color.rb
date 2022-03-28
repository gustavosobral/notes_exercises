class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.color_code(band)
    COLORS.find_index(band)
  end
end
