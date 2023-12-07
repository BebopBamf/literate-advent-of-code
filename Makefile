.PHONY: clean

advent_of_code.pdf: advent_of_code.org
	pandoc \
        -V geometry:a4paper \
        -V geometry:margin=2cm \
		--toc \
		--pdf-engine=tectonic \
		-o $@ $<

clean:
	rm -f advent_of_code.pdf
