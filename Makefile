# libretro-content
#
# The content that's available through the content downloader.
#
# Commands:
#   make
#       Builds both the .index and .index-dir files
#
#   make create-index
#       Creates the .index file in the given DIR
#
#   make clean
#       Deletes all the .index and .index-dir files

SUBDIRS = $(shell ls */ -d --escape | sed 's/\x27/\\\x27/g')

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
