# "Already created" check
if [ -d git ]
then
    echo "Git directory already created (it will be rewritten)"
    rm -rf git/*
else
    mkdir git
fi

cd git || exit

# Init repository
git init --initial-branch=master

# Set some settings (aliases and configs)
git config alias.user-level-up 'config user.name klimenkov'
git config alias.user-level-down 'config user.name abuzov'
git config user.email "common@itmo.ru"
git config core.autocrlf false

# Commit r0
git user-level-up

cp -r ../commits/commit0/* .
git add -A
git commit -m "r0"

# Commit r1 (+ branch)
git user-level-down

git checkout -b develop
cp -r ../commits/commit1/* .
git add -A
git commit -m "r1"

# Commit r2
git user-level-up

git checkout master
cp -r ../commits/commit2/* .
git add -A
git commit -m "r2"

# Commit r3
cp -r ../commits/commit3/* .
git add -A
git commit -m "r3"

# Commit r4 (+ branch)
git checkout -b feature
cp -r ../commits/commit4/* .
git add -A
git commit -m "r4"

# Commit r5
cp -r ../commits/commit5/* .
git add -A
git commit -m "r5"

# Commit r6 (merge)
git checkout master
git merge --no-ff --no-commit feature
cp -r ../commits/commit6/* .
git add -A
git commit -m "r6"

# Commit r7
cp -r ../commits/commit7/* .
git add -A
git commit -m "r7"

# Commit r8
git user-level-down

git checkout develop
cp -r ../commits/commit8/* .
git add -A
git commit -m "r8"

# Commit r9
cp -r ../commits/commit9/* .
git add -A
git commit -m "r9"

# Commit r10
cp -r ../commits/commit10/* .
git add -A
git commit -m "r10"

# Commit r11
cp -r ../commits/commit11/* .
git add -A
git commit -m "r11"

# Commit r12
git user-level-up

git checkout master
cp -r ../commits/commit12/* .
git add -A
git commit -m "r12"

# Commit r13
git user-level-down

git checkout develop
cp -r ../commits/commit13/* .
git add -A
git commit -m "r13"

# Commit r14 (merge)
git user-level-up

git checkout master
git merge --no-commit develop
cp -r ../commits/commit14/* .
git add -A
git commit -m "r14"

# Delete created branches
git branch -d feature develop

# Logging
log_file="$1"
log_file_full="$1-full"

git log --oneline --graph >"${log_file}"
git log --pretty=full --graph -p . >"${log_file_full}"