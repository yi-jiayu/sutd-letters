pbms := $(wildcard letters/*.pbm)
targets := $(patsubst letters/%.pbm, rendered/%.png, $(pbms))

all: letters

letters: $(targets)

rendered/%.png: letters/%.pbm
	convert $< -scale 4000% $@
