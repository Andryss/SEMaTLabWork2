# "Already created" check
if [ -d svn ]
then
    echo "Svn directory already created (it will be rewritten)"
    rm -rf svn/*
else
    mkdir svn
fi

cd svn || exit

path=$(pwd)

# Init repository and create structure
svnadmin create repository
svn mkdir -m "Create directory structure" --username admin \
  file://"$path"/repository/trunk \
  file://"$path"/repository/branches \
  file://"$path"/repository/tags

# Create working copy
svn checkout file://"$path"/repository/trunk working-copy
cd working-copy || exit

# Commit r0
cp -r ../../commits/commit0/* .
svn add -q ./*
svn commit -m "r0" --username klimenkov

# Create new brunch
svn copy ^/trunk ^/branches/big-feature -m "Create branch big-feature from trunk"
svn switch ^/branches/big-feature

# Commit r1
cp -r ../../commits/commit1/* .
svn add -q ./*
svn commit -m "r1" --username abuzov

# Commit r2
svn switch ^/trunk

cp -r ../../commits/commit2/* .
svn add -q ./*
svn commit -m "r2" --username klimenkov

# Commit r3
cp -r ../../commits/commit3/* .
svn commit -m "r3"

# Create new brunch
svn copy ^/trunk ^/branches/small-feature -m "Create branch small-feature from trunk"
svn switch ^/branches/small-feature

# Commit r4
cp -r ../../commits/commit4/* .
svn commit -m "r4"

# Commit r5
cp -r ../../commits/commit5/* .
svn commit -m "r5"

# Commit r6 (merge)
svn switch ^/trunk

svn merge ^/branches/small-feature --accept postpone
cp -r ../../commits/commit6/* .
svn resolved Lab4.java          # svn resolve PATH --accept working
svn commit -m "r6 (merge small-feature into trunk)"

svn rm ^/branches/small-feature -m "Remove branch small-feature"

# Commit r7
cp -r ../../commits/commit7/* .
svn commit -m "r7"

# Commit r8
svn switch ^/branches/big-feature

cp -r ../../commits/commit8/* .
svn commit -m "r8" --username abuzov

# Commit r9
cp -r ../../commits/commit9/* .
svn commit -m "r9"

# Commit r10
cp -r ../../commits/commit10/* .
svn commit -m "r10"

# Commit r11
cp -r ../../commits/commit11/* .
svn commit -m "r11"

# Commit r12
svn switch ^/trunk

cp -r ../../commits/commit12/* .
svn commit -m "r12" --username klimenkov

# Commit r13
svn switch ^/branches/big-feature

cp -r ../../commits/commit13/* .
svn commit -m "r13" --username abuzov

# Commit r14 (merge)
svn switch ^/trunk

svn merge ^/branches/big-feature --accept postpone
cp -r ../../commits/commit14/* .
svn resolved -q ./*          # svn resolve PATH --accept working
svn commit -m "r14 (merge big-feature into trunk)" --username klimenkov

svn rm ^/branches/big-feature -m "Remove branch big-feature"

# Release
svn copy ^/trunk ^/tags/1.0.0-stable -m "1.0.0-stable release"

# Logging
log_file="$1"
log_file_full="$1-full"

cd ..
rm -rf working-copy
svn checkout file://"$path"/repository working-copy
cd working-copy || exit

svn log -v >../"${log_file}"
svn log -v --diff >../"${log_file_full}"