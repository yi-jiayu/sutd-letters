SHELL := /bin/bash
pbms := $(wildcard letters/*.pbm)
targets := $(patsubst letters/%.pbm, rendered/%.png, $(pbms))

all: letters

letters: $(targets)

rendered/%.png: letters/%.pbm
	convert $< -scale 4000% -transparent white $@

.PHONY: format
format:
	for f in letters/*.pbm; do \
		cat <(head -n 2 $$f) <(tail -n +3 $$f | fmt -w 18) | sponge $$f; \
	done
