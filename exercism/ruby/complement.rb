# Mine solution
class Complement
  DNA_TO_RNA = {
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(nucleotides)
    nucleotides.chars.map { |nucleotide| DNA_TO_RNA[nucleotide] }.join
  end
end

# Community solution
class Complement
  DNA = 'CATG'
  RNA = 'GUAC'

  def self.of_dna(nucleotides)
    nucleotides.tr(DNA, RNA)
  end
end
