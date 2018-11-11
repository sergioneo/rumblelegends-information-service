class DnaReader

	def self.catch_gene (dna, length)
		return dna % 2**length
	end

	def self.remove_gene (dna, length)
		return dna / 2**length
	end

	def self.dna_read_dino (dna)

		attrListDinosaur = ["colorCombination", "beastType", "ability", "secondAbility", "pedigree", "element", "type", "eyes", "nose", "mouth", "tail", "plume", "legs", "spikes", "wings"]
		attrLengthDinosaurs = [6, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
		attrWanted = ["colorCombination", "type", "eyes", "nose", "mouth", "tail", "plume", "legs", "spikes", "wings"]
		dnaBig = BigDecimal(dna)

		return decypher(dnaBig, attrListDinosaur.reverse, attrLengthDinosaurs.reverse, attrWanted)
	end

	def self.dna_read_uni (dna)

		attrListUnicorn = ["colorCombination", "beastType", "ability", "secondAbility", "pedigree", "element", "type", "eyes", "horn", "hair", "tail", "snout", "legs"]
		attrWanted = ["colorCombination", "type", "eyes", "horn", "hair", "tail", "snout", "legs"]
		attrLengthUnicorns = [6, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
		dnaBig = BigDecimal(dna)

		return decypher(dnaBig, attrListUnicorn.reverse, attrLengthUnicorns.reverse, attrWanted)
	end

	def self.decypher(dna, attrList, attrLength, attrWanted)
		result = Hash.new
		parsedDna = dna
		attrList.each_with_index do |attribute, i|
			bitLength = attrLength[i]
			gene = catch_gene(parsedDna, bitLength)
			parsedDna = remove_gene(parsedDna, bitLength)
			if attrWanted.include?(attribute)
				result[attribute.to_sym] = gene.truncate(0).to_i.to_s
			end
		end
		return result
	end

end