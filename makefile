
.PHONY: build git svn clean git-clean svn-clean

build: git svn

git:
	# Creating git repository...
	sh scripts/git-create.sh

svn:
	# Creating svn repository...
	sh scripts/svn-create.sh

clean: git-clean svn-clean

git-clean:
	# Deleting git repository...
	sh scripts/git-clean.sh

svn-clean:
	# Deleting svn repository...
	sh scripts/svn-clean.sh
