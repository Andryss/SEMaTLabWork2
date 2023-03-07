if [ -d git ]; then
    echo "Git already created"
    exit
fi

mkdir git
cd git || exit

git init --initial-branch=master

git config alias.user-level-up 'config user.name klimenkov'
git config alias.user-level-down 'config user.name abuzov'
git config user.email "common@itmo.ru"
git config core.autocrlf false

git user-level-up

cp -r ../commits/commit0/* .
git add -A
git commit -m "r0"

git user-level-down

git checkout -b develop
cp -r ../commits/commit1/* .
git add -A
git commit -m "r1"

git user-level-up

git checkout master
cp -r ../commits/commit2/* .
git add -A
git commit -m "r2"

cp -r ../commits/commit3/* .
git add -A
git commit -m "r3"

git checkout -b feature
cp -r ../commits/commit4/* .
git add -A
git commit -m "r4"

cp -r ../commits/commit5/* .
git add -A
git commit -m "r5"

git checkout master
git merge --no-ff --no-commit feature
cp -r ../commits/commit6/* .
git add -A
git commit -m "r6"

cp -r ../commits/commit7/* .
git add -A
git commit -m "r7"

git user-level-down

git checkout develop
cp -r ../commits/commit8/* .
git add -A
git commit -m "r8"

cp -r ../commits/commit9/* .
git add -A
git commit -m "r9"

cp -r ../commits/commit10/* .
git add -A
git commit -m "r10"

cp -r ../commits/commit11/* .
git add -A
git commit -m "r11"

git user-level-up

git checkout master
cp -r ../commits/commit12/* .
git add -A
git commit -m "r12"

git user-level-down

git checkout develop
cp -r ../commits/commit13/* .
git add -A
git commit -m "r13"

git user-level-up

git checkout master
git merge --no-commit develop
cp -r ../commits/commit14/* .
git add -A
git commit -m "r14"

git branch -d feature develop

git log --oneline --graph