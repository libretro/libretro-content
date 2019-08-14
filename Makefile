SUBDIRS = $(shell ls */ -d --escape)

all: clean
	@echo "" > .index
	@ls -d */ | cut -f1 -d'/' > .index-dirs
	@for dir in $(SUBDIRS); do \
		echo $$dir; \
		DIR="$$dir" $(MAKE) create-index; \
	done

create-index:
	@cd "$(DIR)" && ls *.* > .index

clean:
	find . -type f -name .index -delete
	find . -type f -name .index-dirs -delete