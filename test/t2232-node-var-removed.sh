#! /bin/sh -e
# tup - A file-based build system
#
# Copyright (C) 2021-2024  Mike Shal <marfey@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Make sure we re-parse if a node variable is removed.

. ./tup.sh

cat > Tupfile << HERE
&node = sub/file.txt
HERE
update_fail_msg "Unable to find tup entry for file 'sub/file.txt' in node reference declaration"

mkdir sub
touch sub/file.txt
update

rm sub/file.txt
update_fail_msg "Unable to find tup entry for file 'sub/file.txt' in node reference declaration"

eotup