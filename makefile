
.PHONY: all git svn clean git-clean svn-clean

all: git svn

git:
	# Creating git repository...
	sh scripts/git-create.sh .gitlog 2>/dev/null >&2

svn:
	# Creating svn repository...
	sh scripts/svn-create.sh .svnlog 2>/dev/null >&2

clean: git-clean svn-clean

git-clean:
	# Deleting git repository...
	sh scripts/git-clean.sh

svn-clean:
	# Deleting svn repository...
	sh scripts/svn-clean.sh
