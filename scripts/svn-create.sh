if [ -d svn ]
then
    echo "Svn directory already created (it will be rewritten)"
    rm -rf svn/*
else
    mkdir svn
fi

cd svn || exit

path=$(pwd)

svnadmin create repository
svn mkdir -m "Create directory structure." --username admin \
  file://"$path"/repository/trunk \
  file://"$path"/repository/branches \
  file://"$path"/repository/tags

svn checkout file://"$path"/repository working-copy
cd working-copy || exit

cp -r ../../commits/commit0/* trunk/
svn add -q trunk/*
svn commit -m "r0" --username klimenkov

svn copy file://"$path"/repository/trunk branches/develop

cp -r ../../commits/commit1/* branches/develop/
svn add -q branches/develop/*
svn commit -m "r1" --username abuzov

cp -r ../../commits/commit2/* trunk/
svn add -q trunk/*
svn commit -m "r2" --username klimenkov

cp -r ../../commits/commit3/* trunk/
svn commit -m "r3"

svn copy file://"$path"/repository/trunk branches/feature

cp -r ../../commits/commit4/* branches/feature/
svn commit -m "r4"

cp -r ../../commits/commit5/* branches/feature/
svn commit -m "r5"

svn merge file://"$path"/repository/branches/feature trunk --accept postpone
cp -r ../../commits/commit6/* trunk/
svn resolved trunk/Lab4.java
svn commit -m "r6 (merge r5 into r3)"

cp -r ../../commits/commit7/* trunk/
svn commit -m "r7"

cp -r ../../commits/commit8/* branches/develop/
svn commit -m "r8" --username abuzov

cp -r ../../commits/commit9/* branches/develop/
svn commit -m "r9"

cp -r ../../commits/commit10/* branches/develop/
svn commit -m "r10"

cp -r ../../commits/commit11/* branches/develop/
svn commit -m "r11"

cp -r ../../commits/commit12/* trunk/
svn commit -m "r12" --username klimenkov

cp -r ../../commits/commit13/* branches/develop/
svn commit -m "r13" --username abuzov

svn merge file://"$path"/repository/branches/develop trunk --accept postpone
cp -r ../../commits/commit14/* trunk/
svn resolved trunk/Lab4.java
svn commit -m "r14 (merge r13 into r12)" --username klimenkov

log_file="$1"
log_file_full="$1-full"

svn update
svn log -v >../"${log_file}"
svn log -v --diff >../"${log_file_full}"